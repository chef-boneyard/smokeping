@test "Check for Running SmokePing Process" {
	ps ax |grep -v grep | grep smokeping > /dev/null
}

@test "Check SmokePing Binary" {
	run which smokeping
	[ "$status" -eq 0 ]
}

@test "Check FPing Install" {
	run which fping
	[ "$status" -eq 0 ]
}

@test "Check Curl Install" {
	run which curl
	[ "$status" -eq 0 ]
}

@test "Check SendMail Install" {
	run which sendmail
	[ "$status" -eq 0 ]
}

@test "Check rrdTool Install" {
	run which rrdtool
	[ "$status" -eq 0 ]
}