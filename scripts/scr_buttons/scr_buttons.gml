function button1_p()
{
    if (global.input_pressed[4])
        return 1;
    
	if (global.input_pressed[7])
        return 1;
}

function button1_h()
{
    if (global.input_held[4])
        return 1;
    
    if (global.input_held[7])
        return 1;
}

function button1_r()
{
    if (global.input_released[4])
        return 1;
    
    if (global.input_released[7])
        return 1;
}

function button2_p()
{
    if (global.input_pressed[5])
        return 1;
    
    if (global.input_pressed[8])
        return 1;
}

function button2_h()
{
    if (global.input_held[5])
        return 1;
    
    if (global.input_held[8])
        return 1;
}

function button3_p()
{
    if (global.input_pressed[6])
        return 1;
    
    if (global.input_pressed[9])
        return 1;
}

function button3_h()
{
    if (global.input_held[6])
        return 1;
    
    if (global.input_held[9])
        return 1;
}

function left_p() { return global.input_pressed[3]; }
function left_h() { return global.input_held[3]; }

function right_p() { return global.input_pressed[1]; }
function right_h() { return global.input_held[1]; }

function up_p() { return global.input_pressed[2]; }
function up_h() { return global.input_held[2]; }

function down_p() { return global.input_pressed[0]; }
function down_h() { return global.input_held[0]; }