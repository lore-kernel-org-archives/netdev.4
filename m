Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.188.174.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773151;
	b=qshfrZ7C/6jCbTt3ZxLUftNeb5s9E/l3J68Iwog5VAg6HxGZP7SGOrdjWY5U+JKkhMHc
	 mm4saj44NCwzRwOPOjIFHZcmOi4hv4wQnPiz9r2i4TavJm1vWGLv6Bb/hRfd0jo22XgQ5
	 FiLvVNYYaN1snp6RnMSPoowuPMygKuJTXTUEBLZnTeGnc/aSmPkKq6Opmv+YDxhC78as2
	 GqYVJYGjnY56Xke1xGYvJXVk3T6mYJwh0mKK+WR3CWVvoS9CvEG6y+XZt94agXyguvTa3
	 ET6whCTxel7n0/L1Vy+g80gz7ciE++B1DIU/GpU2Tj2asDac6WheosVHs2eoiu2vaPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Bluewin-Spam-Analysis:
	 X-Bluewin-Spam-Score:Date:From:To:Message-ID:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Priority:Importance:X-Mailer:
	 X-Originating-IP:X-Originating-Port:X-Originating-Client:
	 X-CMAE-Envelope;
	bh=zplzVn/F2VKfBYHniqWKJY1iWMCa5/+Jz9ZevQDjGKk=;
	b=HrNH8BQwYH6zxoiUuemr8QXoLaipfWfmZaZ3/XegoZHh0rJ34cu5OBTGcug66ONonbZR
	 gH8xSUE9KjKJkJgein3ry8DOI7PNqMj1ObTc0GPzE/D2CxPo/UUoo8xc9rSbRVsdWQb1d
	 3TPl3BKmIkQT6STKYjPfpEPowljZyXcrMQnEW1g3WfKehMgZBX3nld+hGg+GKNSek2fe8
	 1WTgomjllbJn/KDIe6FO+B6YiUu17XS3O5AKARVbu3xvIXN+WHY7FeI7kgytbNUPGNGpK
	 0TBc7xE8Sh/rP8VV6+zgHntJozkLgxjbroKOWbPgKG0J5iNGGGV4RuPMeUDr4Hk6/Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bluewin.ch;
	spf=pass smtp.mailfrom=bluewin.ch;
	dkim=pass header.d=bluewin.ch header.i=@bluewin.ch header.a=rsa-sha256 header.s=fxzs-2048-20230414 header.b=XjWfjqkH;
	arc=none smtp.remote-ip=138.188.174.9
Received: from mailout-002.p.bluenet.ch (mailout-002.p.bluenet.ch [138.188.174.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D72606A31F
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 20:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9D72606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bluewin.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bluewin.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bluewin.ch header.i=@bluewin.ch header.a=rsa-sha256 header.s=fxzs-2048-20230414 header.b=XjWfjqkH
Received: from as8-core-mw-http-api-7b88d97459-cvv4x ([100.105.75.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 256/256 bits)
	(Client did not present a certificate)
	by mailout-002.p.bluenet.ch Swisscom AG with ESMTPSA
	id SgTuxehzMoJKjSgTuxw4p7; Sun, 15 Nov 2026 20:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bluewin.ch;
	s=fxzs-2048-20230414; t=1794773142;
	bh=zplzVn/F2VKfBYHniqWKJY1iWMCa5/+Jz9ZevQDjGKk=;
	h=Date:From:To:Message-ID:Subject:MIME-Version;
	b=XjWfjqkHejOIyBp5yykTWQz+bNbsW1R7qAzFb0Yfp/VWGE8nnduVOOnK0JcxeU2dU
	 QDosN2P4MnHcIdxqf3w4Cq0IEV0E5R/QTm/FDDUqF1IqapZ/yZF03CtNURxW4/OiuT
	 ydpOaKbnk3VXtoqcuuGx+7eUjUQYbiNPTdjBLF0GlJTaoKe94FW31X5wzrjAysXrB6
	 kWNxQCheKbAHYK5ex7khUjFHv7CC+UvjTJl3nhyt1kMnRNCnnCzQxoKTV9FJDL0Wgp
	 rVhGKtW6h/FIjsgQv3nzDn1HquYgsjfNM5ezcIaSqxxpo3kjNR4m7/MfJKbYAjPI0S
	 yBtkG2GetlRuA==
X-Bluewin-Spam-Analysis: v=2.4 cv=WZ+Z+EhX c=1 sm=1 tr=0 ts=6afa1096
 a=VISF1i61Q2X2a5HvQX31nQ==:117 a=EhBcfLih76IA:10 a=IkcTkHD0fZMA:10
 a=38Ydp8-8ttRiAkFsikoA:9 a=QEXdDO2ut3YA:10 a=GUUIumUfsnlB5vJ7h8ru:22
 a=zY0JdQc1-4EAyPf5TuXT:22
X-Bluewin-Spam-Score: 0.00
Date: Sun, 15 Nov 2026 21:05:42 +0100 (CET)
From: thomas.kesselring@bluewin.ch
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Message-ID: <139459276.10496386.1794773142423@email.bluewin.ch>
Subject: [BUG] iosm: Intel XMM7560 (8086:7560) fails MBIM initialization on
 ThinkPad P15 Gen 1
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v8.47.153
X-Originating-Port: 443
X-Originating-Client: open-xchange-appsuite
X-CMAE-Envelope: MS4xfFqehJgRME2LF4hPFZstcJPUhdQFZKU6J/0SnIcl2FikaosUxTq2coNTyi8e079p+M6RyHeIYT7VEWVhRSJwCluNI92qg0KW8mM61QVu6Nx9UM5YeQ/S
 DjXFntEwHnHqV9Z4FnznZnhdIW7zkUQrxz4Q6gEqdKOKK75hkRYRTNN9ZHluQUjie1SGk1+XBXLDBwLAFkKU1qpT3hjqxZ1MntWb/XeaGgDKsbRQ5Q2vg+ZO

Hello Linux networking developers,
I would like to report an initialization failure affecting the Intel XMM7560 LTE Advanced Pro modem on a Lenovo ThinkPad P15 Gen 1.
The modem is detected over PCIe and bound to the in-tree iosm driver. The driver creates WWAN device nodes, but the modem does not become operational. ModemManager reports a transaction timeout, and direct MBIM access fails with an I/O error.
1. Hardware and software
System: Lenovo ThinkPad P15 Gen 1, machine type 20SU
BIOS: Lenovo N30ET57W (1.40)
Modem: Intel XMM7560 LTE Advanced Pro
PCI ID: 8086:7560, revision 01
Subsystem ID: 1cf8:8601
PCI address: 0000:53:00.0
Driver: iosm
Distribution: Red Hat Enterprise Linux 10.3, x86_64
ModemManager: 1.22.0-7.el10
The modem previously worked under Windows but has never worked under RHEL on this machine.
2. Tested kernels
6.12.0-211.42.1.el10_2.x86_64
6.12.0-211.74.1.el10_2.x86_64
6.12.0-264.16.1.el10_3.x86_64
All three RHEL kernels exhibit the same failure. An unmodified upstream kernel has not yet been tested.
3. Kernel messages
iosm 0000:53:00.0: enabling device (0000 -> 0002)
wwan wwan0: port wwan0at0 attached
wwan wwan0: port wwan0at1 attached
wwan wwan0: port wwan0mbim0 attached
iosm 0000:53:00.0: ch[6]: confused phase 3
The confused phase 3 message appears approximately 11 seconds after device initialization begins.
4. ModemManager failure
ModemManager recognizes the device using its Intel plugin, but initialization subsequently fails:
[modem0] couldn't start initialization: Transaction timed out
[modem0] fatal error initializing: Fatal error: modem is unusable
Afterwards, mmcli -L reports:
No modems were found
5. Direct MBIM test
With ModemManager stopped, I ran:
sudo timeout 30s mbimcli -d /dev/wwan0mbim0 --query-device-caps
The device could not be opened due to an input/output error.
The kernel also reported:
iosm 0000:53:00.0: msg timeout
iosm 0000:53:00.0: PORT open refused, phase A-CD_READY
6. Troubleshooting performed
- Confirmed PCI detection and iosm driver binding.
- Confirmed creation of WWAN AT and MBIM device nodes.
- Tested three RHEL kernel builds.
- Verified that WWAN rfkill was unblocked when checked after boot.
- Checked runtime power management: device active, power/control set to on.
- Tested MBIM directly with ModemManager stopped.
- Performed a complete system shutdown and disconnected external power.
- Performed a PCI reset through sysfs. The kernel reported reset done, but subsequent MBIM access still failed.
7. Expected behavior
The modem initializes successfully, exposes a functional MBIM interface, and becomes available to ModemManager.
8. Actual behavior
The modem is detected and WWAN ports are created, but MBIM communication fails and ModemManager cannot initialize the modem.
9. Questions
Is this a known initialization issue affecting XMM7560 devices and the iosm driver?
Are there upstream fixes for the confused phase 3 or A-CD_READY errors?
Could additional iosm dynamic-debug output help identify the cause?
I can provide further logs and diagnostic information if needed.
Thank you for your time and assistance.
Best regards,
Thomas Kesselring
