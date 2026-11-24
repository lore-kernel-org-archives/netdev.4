Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795492249;
	b=cHdRns/EZfk9r8jeoHDWJSGAttkvPiVaRUDpQk2yle/Y30GJe6i6oJ0CyPfp4BJsUWR1
	 tROAZRa3V+Zng0o8nOpiMBFTF1vKFLi2Ua3zWPblbQ94o1hIorXFjijJIWFi+cxWvqLde
	 cXhN/r9zFITjBfQobH39V4D0xj8r3y49vR/D7yTsb11rIiXEo5XgS88VVW8zfBs6LD4I/
	 Twhdm5ngOQ3hjrVMP90NG6694ZYZY9x3tjjF1DKsqJnTevWFIlZ73a8NdBYOxcdhM1SPU
	 Q7AhNm0Stvx6NmXc+2o10TmA25RXfJRL3yeoaEBiTEbhf/YYvyaD9/JXbx7Vxnjztvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=SviQo8lvpKg+crVjbk0qiAoK5GBpQbaYPD/sVxmSvNE=;
	b=HyakEtI567wdvJwPvWl5EPXIPKtpSXOmOzNDNx55y4UTmnFQXvfjxQipEvlrahEJgc2y
	 UTpPF2ozT3ksVov8B0zGCMnZy1OUcY37VCPpze6bfHsdjCnMycdOsdKgsYGYbtvF0wdfI
	 xjbn2FuozHiBUrC0BJitsgRY3hNLrVKoUSSsYh/aB/HmApAxLrS4lU0dHn5dS0/ymzcwm
	 vvqQbWyC5h4eGdMeNUuFi31wu4LWbqVo2amQ1Z4nzDfzWRUsUQaz8f/FaIXBqlve9y9dH
	 Fpiv2Tem075xT1wAIVbxG3QfGr32UjsddXEu0sBx1SgBoptuMZLNBaeHdYTcA6HsBhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rEpI7dz3;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088AC606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 03:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 088AC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rEpI7dz3
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so36526985e9.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795492247; x=1796097047; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SviQo8lvpKg+crVjbk0qiAoK5GBpQbaYPD/sVxmSvNE=;
        b=rEpI7dz3kCuGlfpURQuZ0JMLP8GarotAB2ZTfIVV9ILVAm/p/uCRkDSN5n6ivcs5Um
         ieIXR0Nnw45UQPcSa4WLuV757SayNQHTGGCmUJsc57/WWYjcJg2FF/b2lowjujke6IsD
         cuY+cYaKxpGR2sAkJTCBKVxf4iGCF8QnSbLdrQesxdeoxNSwSMs7eGv3oYbMfZcEPEMJ
         bihpco0+Q3w1YC/ud2X5GanRd8xZZHlYO4Y8Ha9WC8NKeztUwOdTWnRS5RsCs9T7BalQ
         LBpNtB7MQ7fBXB2kSUX5LWWY/pG47YQVqKQrMwTgBrTiY2GoExTWaTZcFZZOSsNvCKde
         9mgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795492247; x=1796097047;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SviQo8lvpKg+crVjbk0qiAoK5GBpQbaYPD/sVxmSvNE=;
        b=p+66v4roT8qAC8TN4fYRE15dkS1MsHqVmSvpEOapqehIREg+HoS48TxrBJnRFiFVdq
         Xz+yson4qYAgHctkFyn3JvQPw4jsQXG6LwLPiQ4JPs2YjP7XrC436q4/wPrjFbIiZ4Pm
         NeKCofLY2g+Uwg4NTQyF+fxmF7oL8Rj1gjVEmWddnTM+Ka8lGDmPvfetC5TSYIbVp3Za
         j34OoTbbVE4JVxLlgAfZtEI+i5zCTiAVVbeyU4qywJn6GhK6RHnJgBiWZi4asnHJq2CO
         VziGSoFTaEW8OtpG3i4PctMwBwbZMZIYg5ZoIkfMtiY2FnFocj6eDloXXlnuiDJZDMkt
         pdbw==
X-Gm-Message-State: APuU4Z8HTOST69mpMO6PdgkjePFb0/hSj0TNV4+b/pwsoukG6QbL830f
	icQx8/bArlN5kLsLqaJCjlvMSWmK8Vl8eVOcKYCnvEeU8LZYeOkE88gj
X-Gm-Gg: AZFdTZcJGYB8jlQh9/pNVmMmzVXvpfAGE6moYaa160SnVoQtfaWI9ucg6ttZjFrq0d7
	ppT0frqmijQeg0+IsRzC/eTcXuS3vM88YKXDM5AE5Qc/UC8In1KGnvzcOzI53Bbd2V039IDpoPj
	gIeN8E5X3FITCP4RQuo88UaV1JPSH4jY1qOGNRZLTAbnA+CFmonEWwjofoI9VWbCSh6yfMNw8Xd
	94NnVHkMDdiN9QZ1TIjfGZ8Bpt6fGXahh4LXzxwfBKe7GEDFo2Uzsg6VzAjoj0maehXFBVM1rvN
	wEPjQcWg9KN0WnbNwLvwUzpeQaYcq7QkuPrEQpqfVZGKPnFVZwp9iif1GzHAtIW/yUFeQM9ePG6
	UcfXF2VveQM1nGz7UKxgl0cVlBH1lmURUNnmbvw2SUx3N+dkpJbavCtLcmEAmayvRkJAO6NUXCF
	GQqmNDuB+wpjgCQU3abuPP69/1a7+dybmb0k557Mk597H9x/P+RFNdYSppyFWJFpmWfDeJ7UtaE
	mF3mDox0r354poavayuikkUpMseODaIYx3ee3FXp5G+9cgUcvb5If9vAOqmNqvuQR39mz2Vu3jv
	G8H3WyS3p579qJcyluWlehIvccHIqRU9fflf83VJeQw2G3OO/rrkYQ4=
X-Received: by 2002:a05:600c:4e87:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4bb88938d38mr283467385e9.30.1795492247145;
        Mon, 23 Nov 2026 19:50:47 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm403556785e9.1.2026.11.23.19.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 19:50:46 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Subject:
 Re: [PATCH net-next] net: dsa: qca8k: select two-byte headers during setup
In-Reply-To:
 <20261124-b4-qca8k-two-byte-header-init-v1-1-c644025b69fa@gmail.com>
References:
 <20261124-b4-qca8k-two-byte-header-init-v1-1-c644025b69fa@gmail.com>
Date: Tue, 24 Nov 2026 06:50:16 +0300
Message-ID: <179549221678.4.12970466946370203407@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Additional hardware validation on the Almond+ (QCA8337, MASK_CTRL 0x1302):

With the conduits down and all physical port MACs stopped, private test
instrumentation set only HEADER_CTRL bit 16 before the unchanged
regmap_clear_bits() in this patch. Readback confirmed 0x00010000 ->
0x00000000 on both initial probe and reprobe. The identifier remained zero.

The subsequent normal two-byte DSA path passed 600 byte-exact UDP echoes,
20 ICMPv6 replies, PHY/MIB checks and two Ethernet load/unload cycles.
Watchdog expiry returned to the installed OpenWrt, where LCD, networking
and watchdog checks passed. Flash was read-only throughout the RAM test.

The private instrumentation is not part of this patch.

Fil

