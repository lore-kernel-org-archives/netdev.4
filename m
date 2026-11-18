Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032335;
	b=hSZa8CFpth5aohFWrvxXxql999CbZsoKXZHZ0HzqB+NmpfDq5nkDAiZZZKAS8ne//G4n
	 U/IL2QHsMqSvz3WEvYsAEvAM/SEbCCuh7gcrmYrmAFOh1KVnhT+bIiiOvUPlH4GpvBXik
	 6VovXeVvZnHKiA+mDYiuop45Y5xzNcxd3flTwkgWGIi4MaXaK1IUug7mOvfd5M1tRk5q9
	 jgMth/++KxC8P5kgcHZsk1UiRy9K3x558CuNfB6XOzXKw7dolvUFuHFa7BrZdZMml3Vc/
	 AxExrps4t1a+M1M3KIn+5kuMIbwc17L/tzO9kNgHlm5FJ3SkYgy1Qq72TawnX1bmD8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vm6X4RXhkwTGS0rODxxBI99H8aOAkurBTqwazIDQj1E=;
	b=VWtcgN5X1eaWhYcMuqax0QBpz2haS4WRhEa+SoEUPq+4ZgC6SVg+QJKRBZwlF14yGCmX
	 jrC+1KVQxBvctZ+MnnmY2pqW0ILGf13b7kTxYHQRygdiAZNk7Y+iprzFtG0PiRSkkSIaD
	 hw47pSpUr6jq+04pf13FtkyG12OnUvziq6ov0f6nXub/I3iJXkyYmiJb4SvsuQcVn+su8
	 0dHN7lbkeT8t2d/Z/slYw4PMBmNqG8sfsa41+UcyyGQLSfUhotFXz5eYkPoqu+LQAUI2J
	 hGaHpARKoapba4wTNYqiQJL+ShSVqYbVPNpLmRplNbQfd30GuPGj6VDVSeFJI4P5UUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q1FMbmrY;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B549A60A2608
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B549A60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q1FMbmrY
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-382ecd5cf2cso210898eec.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032334; x=1795637134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vm6X4RXhkwTGS0rODxxBI99H8aOAkurBTqwazIDQj1E=;
        b=Q1FMbmrYQQM0s+ITTtFVk2rDTCxKhZq0tHSCa2oNwKmMIhrmem7HiE4QVyRnT/aIyH
         DXfy3kpwMUJOIhMYIMy+ACBusVXxNb97WjPXy3ICtPgpymxbpK0/ogDILwffmlNlyHZq
         eFMxQxRZ8XFVEd972N+qeDY4Nq9JbbPp24pcGo4fctMzvMj5hnnox2rz/WUOKIrG/GQ8
         UYxRNzI8UIo14siV2QhWPTiAVnItrl2hCUZZrDkDRCyr2ZECEJjSWeooQOiNiQ3w61/C
         ryWjtdjI+8N6tzj8SewjK/TnGSE2EQeqN+0w39ywVYFJPV1JPjAA1lMfVffOxP9LKXSr
         VMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032334; x=1795637134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vm6X4RXhkwTGS0rODxxBI99H8aOAkurBTqwazIDQj1E=;
        b=g6ykJUjc1pQBTsw60u/kr+bRUN75zwlNh5//Ba7KS24K6kpkwjBv+VjeJmEkpg9YSg
         CkLtmhU6hKUHoLsxhaD3W4CZdagexXIOkk2EdXNKhNwS45XpDj75ZFk/sBZLXhsPxuUX
         NnCybWk9Kn4wmDT0Nbxt6Sa4Fc3/d6rxJi4Vn4UQ1qnwbS0F1AbvjcAZyKnEuWBZvmT8
         2MjSMHKGKaFKmuNn7Nzkac422gtCBxQdKcgMAWse1TU6dI0z+WRwMzA4AFFnF1RCMYUo
         hZJLMKkxGzLL0CKkWzrKNX3pyR4VBr66Ih6e6STVSlbP4ZP98xlYsE97WlGoUCZHqqgz
         EHEw==
X-Forwarded-Encrypted: i=1; AL+hErGGGaqnN/4kTMfI9ErKJuPHk2lNGQyzgGhP5vIjCSzp5zW+C74nRqLaVye4EFvufvELfHLIPpI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FA9ZB72GalcfW0d8Hv75Yp5hw0XgDS/XfH7D+LDXAuhYaCiaF
	efkKlJoBAyFKJfkJNOicFaHJLFllqSDlvKXTMkC8McK0yyGaeHw0UWK/
X-Gm-Gg: AZFdTZeVmk0Z9LqQy5sh2UWJYYhFM9Ai2y6IMdtvJfwKl4JeD1n0z4dBhhD2Jgnd/Pm
	LDel3ZT7xadIpmVo5ctRdhMtNnS0PXajfB+ZVDJboq0JIkRcNBmHoXIcdhZKIP7vQ8D3SXJ0+Js
	CIDWF9l5iiUmhhld6r2nb8usUwwc60b1Jtia1LgHzimzyForONETGm4VQ4idYQ0zKR8KbOghW/O
	JJI94Tjbdx6pxpEsZQjLNFuL8DbFqdeq14lJuslmEoIaHJRdC6S5N6sjxItKx87qbub6u6+3q2G
	vww1m4e0IdojjU7ZzcEhdgGp2/8ymczd5HkyrFIjHf7kFfu6sLSGFT8TOtBbhL4WfZHfd9dHIY8
	9UbAlNsb6G1LvlvmnK0lDFfHfSZRmz3jd/YJ3dIjz6Bct9pvLKoJJApXBMiX6YetRNtbGhqzlc6
	ZAnBOGES5L/ZPmQzKjT+vGOZgahH1saTVd94oA9Ackxi35sgToNa3OFYWul6O7L4jrCdVd2pCXH
	LU2/SBAyrMPJ65mMhhSg45GXHolqIyRSdbSGS3RM42YiiMku2bDqvklvaVo9V7be96yc+DiGWRD
	xFHAXzBQoKN/x955tXu+GaBhisbEABc55rD3EZfwhvnI9WibhdhInenQZp+1J6SRBMA1CpBxa+N
	KUaJQPSV9IwM3jYjndbS3PJFv+3yK
X-Received: by 2002:a05:7300:ae97:b0:382:2ae3:b1d0 with SMTP id 5a478bee46e88-383ee2228b7mr420599eec.13.1795032333782;
        Wed, 18 Nov 2026 12:05:33 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d401fsm9683206eec.20.2026.11.18.12.05.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:33 -0800 (PST)
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
Subject: Re: [PATCH net-next v3 2/3] i2c: xiic: add KUnit coverage for register access modes
Date: Wed, 18 Nov 2026 12:05:30 -0800
Message-ID: <20261118-timecard-common-301f823ddd-r2-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179502617695.3136.6995182814188526026@kernel.org>
References: <20261116-wiwi-v3-87afa10a8-2-ahmadexp@gmail.com> <179502617695.3136.6995182814188526026@kernel.org>
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

Agreed. RAM cannot distinguish a byte read from a truncated word read
returning the same value. I have stated that explicitly in the Kconfig
help and test comment, and retained the direct-x86-64 restriction.

All four KUnit cases pass in x86-64 QEMU. Separately, the source-derived
accessor fixture records which I/O accessor was called, including its
width and address. Removing the forced-word read branch makes that
fixture fail. This is software accessor coverage, not a measurement of
PCIe transaction widths, and I have not added runtime indirection to the
driver just for testing.
