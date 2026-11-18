Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032338;
	b=R4Yk2eSrnTNVHTOUJovI1QRKgyV/v81Eb+yE0sDhQWPTQ8qgOgnXVQFf8miIB94L73au
	 mGpF7IGq7JtSLaCjsOqYK+O9s3owTB2jHPnSAK+jeeXOh/b5N7/45Pbl+pIMhJ3VmLtJC
	 Q10Q3Udl6ZE2+QmK6hr2BI5IE0xdWoiw0jc8i9KVC5wmrBBhJBS1yKhVUEu4Ieh4G5qyB
	 +lU8LCj9Eh77+S15u0jXr0lLaqUio6+tLrNxCIzx2lgLtsWDU9FWRkoiG/N91n76b7+Hp
	 m5gGQhkO98deJ9Yn9bweThdUgs6RQDR76n5EzPZF82OLsGhp5U/BZWnSqBZZP38sRmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sT8BXmWr3ZtRZWaM79NQqvkyqTyjCTuzoolorXg8m8g=;
	b=OF1n+y/w2O0RBpjlHE14SBSvxCdqfJORBEtpirF6nvivVpdrSAW+POteGV1mjTXQLm1Q
	 nuNlCI5VUdKae++EEFwp3C65M7b4SaAcx2R1DSqa7eN8xj8VE7QsTcKPyBzRHUsPa0SYA
	 LzwugrgP7zMvBPX/wsoW4MrwpMkK1Q9SE1yHkYxCCy1ZmH6KKXy1s21J7N5G9HosDtXZ3
	 ECWAbPMxVRwXNNSBquDBpRCOsv9F1yfso7eoy8wxe8ZwQ4oyoCrqUZucxa3FC/WhdTqee
	 lk5ZHHyAJ7ZddHyeODAKKgrmtz/rSqkd0PmdYcB/uso86JEXMG0CXdEtxMxI2ifPjaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XlcqI/WD";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD2360A380D
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCD2360A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XlcqI/WD
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38190551625so2533618eec.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032337; x=1795637137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sT8BXmWr3ZtRZWaM79NQqvkyqTyjCTuzoolorXg8m8g=;
        b=XlcqI/WDSL40sFhRfuRWgVgFbUDcqd4dc89nkRX5hq+S6M8QdNcniDdhvF5vb59JR9
         +24b2dBI34OdoIn/aYyBvSwB9tz2lynON+qJxamsUAXHpVmYD/3ZKBFhNp3ecyO+jlfH
         yLH7pY8+TH7FTvuT5+ik8N0FN9+di52g35SX1/oNpSBHggxVrH/KYVnpZPxnnGG7tPAK
         ijRQX/dWp/4oznE3o52u/IE1GSe+QjU5+euXF7w4YEyxGh1/eE5NSDL7B9b1dtmhE3RB
         XHUDBQWdTuTfQpILYYqp1x29wahndXSFG4yJo9XWSRArReOv4M9bjUoseDYx8yWpnopP
         7jSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032337; x=1795637137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sT8BXmWr3ZtRZWaM79NQqvkyqTyjCTuzoolorXg8m8g=;
        b=wNaHy1zifrQqK9d0NLyuZWOLbhO+geNRxcq66Q7DFNgt/yZNtif8DAg5gCHxwTndqX
         OelYRVRenxmgi8RWuO6C5YanPkdqDW3qkTfJWwuS6ujz2wc+/dcLcZF7qFzGWMfFPuup
         QnUtejYw79aXAkw91szc2CYkt95OlXQuzoo+AUi7Ko/UMZ7Kd/LDrzriUcmSgIrrXZNW
         Sou8/OtJVFspov3pGi2VMxmcVSAp+ZRd0UPQSnC/tYsOZWfEmzDp1ClbMWnosGQksFKj
         uGf5v1rk3rH0rvHwd2mncAuSqW5HGpo1YwdQ5cktaqTJewo6RXcJSlDErFIlT1sLpA1A
         tAeQ==
X-Forwarded-Encrypted: i=1; AL+hErFaCAUSPV0JheR4/U7R4u5CMNszkRJOiNwzxX64pCAhUhpDnw/oegMG14sNZhMS+YrkkePIDjQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+d4Hne6QSiYiqZS2otR6RuqIoaUdST36JpjOon1mvBkRE7nMZj
	/DtwpMGEWRlEfM5AlMGlFkHk+R9Qci2R330hUTSFmzZPRCm0VKBBBQAk
X-Gm-Gg: AZFdTZeJ4ds/eelpb+cekzlPTHVCBwu3bXEmsFkBOjkwRVVZU2fUwjOj2dHNLNwgkW/
	fcUBBYKOq6/wnxTz+F/wQD5o4zhYRl5kQr//j/CG5G2NtEa0cu3aClIA90WtRrBrmdyYWVWUdF8
	rvU3fVg5RowZH5HdASaq6K0mGM1i6bP9X/3c7k0X03IAlHHhyTTYi5q9DXcfSHB0/G+DlT+40WS
	w4/3P8RLlnPTkoJlF9Hn7r8qFhqLbBt7HV3dYxnToDqoQAL8c54IxcpA6gyUQUGd2NJ2HqqoczZ
	xsGmvf+sbp23Fgei6e1mbwMyEqxOrp6EGY7+QDM/CfhKjcdJl5lZn0vHy4FJOohkQ/1U6Rr/Laj
	LEpsKT4zqGQ3BlMmvHGY4PIwxoTXjjLW0BET1kHGEvlYsIAIKkDzeA+B+LWGZALSsq6I92Zl2QB
	j8OOC7o9m+CjZuFQDxfdrTEU4LTAWJ365NJF/6xV65wEiRJFYDrD50p2stqLhgHDWXmUJIJC+ZC
	6B0PZMTBkK/IxpEJ3rtJWEMORcXcPdyeoi7DWKvzoAO/UQXZ/vdxAc4BG65HMZI0UdjK5ZkV5Hd
	Eqwye3rywkiTe90Xm4utvmzcT3L2Z9GDo7aFwiUtAZjToVo6ViP1G/ngDMOcQ59hFbay3jtPJxu
	d8V6d1lvyH6YmWejZmj/VG2fSklpK
X-Received: by 2002:a05:693c:83d4:10b0:36a:5126:a8aa with SMTP id 5a478bee46e88-38281025978mr3395503eec.27.1795032336889;
        Wed, 18 Nov 2026 12:05:36 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm11752204eec.18.2026.11.18.12.05.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:36 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next v3 3/3] ptp: ocp: support the WiWi revision 02 Time Card
Date: Wed, 18 Nov 2026 12:05:34 -0800
Message-ID: <20261118-timecard-common-301f823ddd-r3-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179502617840.3136.12704245716223038161@kernel.org>
References: <20261116-wiwi-v3-87afa10a8-3-ahmadexp@gmail.com> <179502617840.3136.12704245716223038161@kernel.org>
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

Thanks. I have prepared separate common-driver fixes and a WiWi v4 draft.

The common fixes use tbl[i].value for all boards, mask SMA_ENABLE on
frequency readback, report disabled inputs through the None/0 Hz entry,
and correct the common DCF output frequency to 77500 Hz. The selector,
disabled-input and frequency fixes carry Fixes: 09eeb3aecc6c.

The WiWi table also uses 77500 Hz. Its new init replaces unsupported
output selections, including GNSS2, with the connector's default output.
It leaves valid outputs, inputs, directions and neighboring mux fields
alone. The normal sysfs read therefore names a supported signal. If an
unsupported output value appears later outside the driver, the read
returns -EIO; the ABI document describes this instead of adding the
unwritable "unavailable" token.

The removal concern is real at the source level. An EXTTS request can
rearm a channel after detach disables it but before the POSIX clock is
revoked, without assigning a PTP_PF_EXTTS pin. Clearing readiness alone
does not serialize an enable that has already passed the check.

The separate teardown fix uses a mutex shared by timestamp enable and
disable. Detach sets a permanent stopping flag under that mutex, then
disables and synchronizes all timestamp IRQs before unregistering the
clock. New enables return -ENODEV; an enable already in progress must
finish before stopping is published. Disables remain available to the
PTP core. The IRQ handler does not acquire the mutex. This is a common
fix with Fixes: 627366c51145, not a WiWi-only gate change.

A source-derived pthread/MMIO harness reproduces the rearm window with
the old code. The revised code passes late-enable, in-flight-enable and
active-IRQ-drain cases for timestamps and combined PPS/EXTTS requests.
The tests run under ASan/UBSan; DPLL and routing tests also pass, including
negative controls. Both driver objects compile with W=1 and -Werror.
These are software tests with stubbed I/O, not an in-kernel UAF or a
physical removal test. The card is currently reserved for Windows HLK.

I have sent the four common fixes to net as a separate series:
https://lore.kernel.org/r/20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com

WiWi v4 remains unsent. I will rebase it after the fixes reach
net-next, so the feature series will not duplicate them.

pw-bot: changes-requested
