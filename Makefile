ASM=nasm

SRC_DIR=src
BUILD_DIR=build

$(BUILD_DIR)/main.bin: $(SRC_DIR)/main.asm # Dependent on main.asm existing

	mkdir -p $(BUILD_DIR) 
	# makes build dir if doesnt exist

	$(ASM) $(SRC_DIR)/main.asm -f bin -o $(BUILD_DIR)/main.bin  
	#generate bin file
	qemu-system-i386 -fda build/main_floppy.img 
	# launch qemu, -fda argument refers for qemu to use floppy disk image to be use as a floppy drive.

$(BUILD_DIR)/main_floppy.img: $(BUILD_DIR)/main.bin # Dependent on main.bin existing
	cp $(BUILD_DIR)/main.bin $(BUILD_DIR)/main_floppy.img 
	# Copies main.bin to main_floppy.img

	truncate -s 1440k $(BUILD_DIR)/main_floppy.img  
	# pad images with zero until it reaches 1440kb or 1.4mb