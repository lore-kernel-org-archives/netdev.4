Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807385;
	b=zSnY0EBE2Lof05mzbHQ4b5upLr6MBucV5QjoCOMyOhe/3TxVUQRbRxWSJDwxS8NNkKIT
	 Y8VMpvCxt8PseKHSwVU2TEua3xFpgmwZEjE3CVGDuQEJ6cB4AV4baXAGFFw2SvWmkY6+C
	 VDlqCouUWCc6AZxli2+esni1kDRcz1cTdxjA15PcK34A9imVt2UXunUmu4GC7nJmkzam3
	 i3QCNrGmrHp/nwGTzN4lffq/XVScoD3ulU9m9S9gCwCbcHqsAIPeHENk3uZsC/KA82wDO
	 fZt5MIVsKd1rJwpY7NqG9sFSEe62Rc9d1Atb3PXLs7XFokknQWVhEbpZgvyBuM17oRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=A5PBwT6ZNCwVmsIPiFh4/k3C2FoMFCyG+qeDVaNXFlU=;
	b=iuMot0CyDjiWGyHX9Oq6/wXh5Gb+g/qeGkLC5slXR8YoeGazDuRCy1iIXjdJPd9oRkfK
	 /084dgj1x2YD2o0ZhJ89akV+DSVYRapNx/AA9SS6fZUdGRgnMHINX/bMjeGZwu/s+NcsJ
	 4PeM+vj1qlteq46jE58pxtVDCJVzJQbjrtaOt+yevLwfN7x88pS1qFoPnhYk2LV0YjtVD
	 cFdGd+YoiawWDUBLcRYryOyY0izKvgCgTYdQItbPczitjJ8sv7MMqrWRv3Cmk9185ZHtc
	 7auTUgdiaGmsjJFfxqlQCfxWINe6tozRZjxXWIRr85fwvqo/Ki+1OhtnCAHB1vBFC0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNcX51hv;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750E2606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 750E2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNcX51hv
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b59dfe466bso789984c88.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807384; x=1796412184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5PBwT6ZNCwVmsIPiFh4/k3C2FoMFCyG+qeDVaNXFlU=;
        b=dNcX51hvKeWVxsSS7Rod5LgR0BkAW7PcUWKWqg61xwcTweTcPN0mqgLymc6nYPLo+8
         vGk2cvNZ9iuuakxLYyGZBK6xPVRDPYaiAMUNWKG+e9bkWV76htEq/DWwG16b0dYlDqIM
         zr6F085pac3Jy3ttY2COv6VWulEvdtAlsRG3cPAPdchcuKS7SG8Ipk18zI3B9ZJs5gcI
         qdbgxwKX60dR9ysa3H2wnm3lotZ1FdNHiuP3uCI/YyySik403p0ppPcgL18G2gNsu+VM
         haEgCcojOGeYmNdlDM0wrarhd0oK0NDOwAoBrixEEC970bdWTWxg6gVBqC6GFtzb5Wfw
         075w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807384; x=1796412184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5PBwT6ZNCwVmsIPiFh4/k3C2FoMFCyG+qeDVaNXFlU=;
        b=bPUVn28IVbdI0Mo4gVjkv4A7ersZQEyQ7AXDKdcBgiS2gNMxBk5xqX/qLTnoi661Q6
         2EcVk2GvD20xop8fZVzOzN4g/alWdam1PS8aq+00AOaIFbB5qQprD3oIGNWEVLxIy9Ks
         lL30O+TODpZeWjvYrpyzpgc3TQw3HDHPMckpj4bm4I7jcpbK8Tbl1V2FFvdvmcJQrsRH
         pcAJdwdMjx10uj885s8H5JpLKsjAT1JD/Jcva7UA4PMfQse5OzN2+33ShUJTbAr55xTE
         HcqYXw7SJ59XEuk/OZlX2TbfPs0y7tI9/jBStQ82T5E6hHW/KkH2jQX0iDRJGdVt/xfC
         BMCQ==
X-Gm-Message-State: APuU4Z+CNf4ZwWn5PR2MxmxbdcZh9DSwiSlyP7o/LO0nnmc823tGCRcw
	OI+qI8Jq6RvxLYiB2fS/X1TNIphQ6X0trUZ5YAXhJR5+NJNe+SjSAZnRRsMlF5Cmi54=
X-Gm-Gg: AZFdTZeY9UxxflVK1A6fcWnPg1tV6/iEjYqCCnTxllJwx7nKzcwBTBYX+Z3I+e7X2+4
	iLQ+8fG2tdJ+++Tgt4zVL95DwhoYvw2V4a5xquFsquXgTJnsm+C/H8dvXLQ78dQ/ZklNBGhyOch
	z+QdmZFKbfrgfr2QENiBblc6a9vf1NtmZ3mXbqSZOnRshmiKLJBkiSMC6Rl7Hd9Uo8U3/hXTq5E
	cgwWA8D0Cx4nYiiuhrNQm5loyEvJhCcuPB+C4dJmumlnSfDe2iU41uGPtR7/WuMUWgVcVRHVS6U
	TL1AHRmgCjMa4CsoH0Znq42//dJPcNYyMPazbL+t6ktjU3koMhFEmgW6lk2g4e0MhluhYKkFBlc
	Akeam+JqaNhnrZ9+A1Cn5RrKOm85WDRkUXlRSMli2VIynIP+l+FQmdivVpS8Ls1TDtOFUJO9SJc
	gyzOIdOpIP0YnsGi9LwC0pLkPc4nj7E8vF8/MpLvZEgbl3COVkt/KiOiyypFfR/NQfFSN78jGa4
	kChgNyoINEHdt3XVwPBGR35wMA3cfAoq7IorZa/QoNpam6v7I6xFGOUh2B8de6XRaBvHJcPNLXu
	W6qZ9OP1JxhkRtATeDVLy3VD7ljDQeVGsv7avEiFh/K/sgD84UWf3krJzsq9mSLlDXdq32qd05u
	pTq6C/GTjYI/1ubvM5z49JvruSTbBK7kVQD4oNlsT6W9KwFINTAY+hUKYP3RCDA==
X-Received: by 2002:a05:7022:1585:b0:147:8a40:cdf3 with SMTP id a92af1059eb24-1b5568f00a6mr24043670c88.24.1795807384501;
        Fri, 27 Nov 2026 11:23:04 -0800 (PST)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm97005883c88.9.2026.11.27.11.23.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 11:23:03 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	jonathan.lemon@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	milena.olech@intel.com,
	olteanv@gmail.com,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	vadim.fedorenko@linux.dev
Subject: [PATCH net v7 0/7] ptp: fix OCP routes and SJA1105 pin direction
Date: Fri, 27 Nov 2026 11:22:55 -0800
Message-ID: <20261127-timecard-driver-v7-0-ahmadexp@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These driver fixes apply without the PTP-core series. The OCP detach
path and the shared-PPS shortcut are unchanged.

Changes since v6:
  - Drop patch 8. Removing OCP's early timestamp disable needs the core
    cleanup change and separate validation before it can be proposed.
  - Serialize OCP route changes across sysfs, PTP pin configuration
    and DPLL. Reject unrepresentable 10 MHz plus auxiliary routes
    without writing the mux. Document the selector encoding and the
    nominal-frequency readback rules, including ART.
  - Decode both input and output enable bits when binding configurable
    FB and ADVA pins. Leave fixed-direction boards unchanged.
  - Put SJA1105 PEROUT pin selection inside the existing enable block.
    Existing SJA1105 enable and timer lifecycle concerns are not part
    of these enable-only mux fixes.
  - Correct the disabled-selector explanation, align the author name,
    use contiguous trailers, and retain the DCF Reviewed-by on the
    unchanged code.

Validation (local fixtures): strict PTP and SJA1105 PTP builds on x86_64
and i386, allmodconfig and allyesconfig. Source-derived tests exercise
serialized selector changes, nominal-frequency readback, rejected and
accepted 10 MHz requests, 768 rebind states and SJA1105 pin behavior.
No physical card or switch test was performed.

Coding-assistant support was used to review the reports, refine the
SMA changes and tests, and prepare changelogs.

v6: https://lore.kernel.org/r/20261126-timecard-driver-v6-0-ahmadexp@gmail.com/

Ahmad Byagowi (7):
  net: dsa: sja1105: keep pin function on EXTTS disable
  net: dsa: sja1105: keep pin function on PEROUT disable
  ptp: ocp: preserve timestamp routes on DPLL frequency changes
  ptp: ocp: recover SMA direction from both enable bits on bind
  ptp: ocp: report disabled SMA inputs as zero Hz
  ptp: ocp: correct the DCF output frequency
  ptp: ocp: match ART DPLL frequencies to selectors
