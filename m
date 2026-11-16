Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853267;
	b=MVHqNX9DmQpjyiWgaVOe5CLzi07EyDztqtUz2UwliDqgJevbYWsl3RRKdJn3CzmcN973
	 r7J8aPWXTV4cwCUmpI4WnxVtbOlnF5BPAhoa3vK/gJcQt7c0U4qGokHMx2IYDFua/LsZ+
	 Pxbtuzfx1pQCbKDRFd07VX30JXUtG1Nd3XCjnHONvA5YtIyYgNB6TvzFqrNUnKpemTSvv
	 8eg6luOdoROjJsBQkpxFSSwYWTNn5bK5rzbLrxG6RsnV12opt2I4vGBk/gZgH9oQSOhtX
	 q0ks1A7XD5L6AUIA+JoIYvpE/17kKzf1PDLABbXMgnlOOZpgIixZfFEc64nFkLzECHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s78Uwu3z/zaPq9zjWKMnVssEWBtB7CSjhkYzBSt1kL0=;
	b=LppG6vaiDVdX4Qgw1IFSaNk8nTCvt0na3ihagMdtKgwF+MVvzwr8QwExKJyKcqeg3M1K
	 4qalb0Bv03RHtYZIqTADLfCPRgiHnYlVPj/4ppsBm5dI3NiudlikQX9O6qBgQ07XKGhON
	 hv44lzbIk0SC6DHrQvv475vKDF8fn7imK+ZrlRrJpJ9J8a2WwJqzHthbJXeJwQdSwyWZl
	 AUyL/EzILKVlN8wnJFzxqlhaID2SWFFfPgUYCOyl0jb8sBxpHhVqCQCiQADtsLRkZmjtm
	 aAAYO7Ocm2HQ9PnYTlIrN56h+7OtwOssYiWLuAq+RqyHdPuYjx9Trb5VigpsXq10sbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FpYS8cRh;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2D8606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 18:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B2D8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FpYS8cRh
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so79836a91.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853266; x=1795458066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s78Uwu3z/zaPq9zjWKMnVssEWBtB7CSjhkYzBSt1kL0=;
        b=FpYS8cRhj7TWzlPh8uvoPmp/VYcqp3L3+7gXWqu4nK8ecUw+jAbbkUcIxCoxvnhtOR
         nFycSVy+PoLeKYwcTOs8YcFAQx4n0Q+DMG1Qz3Sy44k9Q++UB/w7TDPG0K5qa+rL0rpH
         5J+13Shh7XikpW6RqRba6h1WOkx3/h9vimFVQEZ6UESXiqcWVdUuPYQLcDOWkMhcv8K9
         9bB0ij7ugic/imlAVr2WmJrz7XZCBrxGST2E57stn2hqP6sQFmvl6PpkmqmANhlZElEJ
         bvpXQuNDLxISRc1tHd7ekko+8JpzgeiLdzW5w19L9myCGGRNZFC51Ta59aLFIpOLDV8E
         1kBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853266; x=1795458066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s78Uwu3z/zaPq9zjWKMnVssEWBtB7CSjhkYzBSt1kL0=;
        b=0h8DVjIaDj96qPFeA2mlSdAbe5SiBodSFFYCUxN1Xc9i1Wl3tJf1IZK/dV6ZK6QAOR
         Nb2GHMHuHNhVZCnCQYjt+9TFc49OyAIs5cS6anSghxw5+VQ8V8HjEL7xePRW2ldZV4XQ
         Xtrrp0suoj6gc9JpO370XlZJm/2JFqs6rQUOu4Yfku5Ge2Sm2VMXLChI5Q8DOfAgnUpY
         VdjGyAjhdju2VZb2vgQ36sIe5mH35NrJn5FuAR597MGgZtHApDewyRA10/nnMGJHhhWJ
         XhaPXv2c+fcU8/ya10uv2n+d7oSmCXWTiuI799IJbByrds1DhX8RzoZGi+M9rnZ3i/rj
         nQIg==
X-Forwarded-Encrypted: i=1; AL+hErHQwUcckSDxlwvmVkTfnc+JIu3mswuKjpkRRbS5PfQmETwco6ifg1GO4qOLiGhtukcFgYrcy58=@vger.kernel.org
X-Gm-Message-State: APuU4Z97/gts6A53NQaVk5vYrflBrY7LbcsSc/ZoSliv7xAN+hMs1b36
	aBg9JFXWpdWFYHKSP8MF4YjwqT2irEpOV9QtaOj9fRdTLf6wib4ueGpZ
X-Gm-Gg: AZFdTZcSX79rLlMLT7WdcBesjiqkG/NlpigXpNUi1MUrhrP8r5E+Dg5TvsRa3AjB85k
	kf6Uw5Ppc2HXPYgRQ6Jda+8Bz5iitugpye8VOp8gBGM2iJXPxAEgus16UJJe9Z7iBZ7XqzflnEb
	I19BZfKJ1kI0iHM4sHlRqitqZHSuZSb+LDFdZjHH3cHb6D5pm/RlxhFvT+GyMyWBD11H4soshb5
	4UZ4BFrLlvmGgY7HpJ3a9erMqITa4ML2adDgXm0rH1bowo1rVPgCQHALA2TN2JCRfVFPCE2gZ49
	3qQspUHSz0kkN01w4jlZ16Ho0HC0qK+z1j2K5fMJl5kNwYaxg8Q4vEjne0lgyWkP1z5jLdsyQ9r
	82/YGvj1t6tMBXCicj1E2Q4uwl+//J2rDOiEjv7suV8dtGHFGJ2shNvWJOLLGDxgqTU5mnY24/L
	Qn6owgbDoLpiaheUkIj6nxcvRSO1fC8XuWUZBxunSMMfc8HvGP6kaocr0sXIoNJXF3gtLNsddmq
	DwabkEYmHWkTqeZMjX54M2eqSAO2Q/mnvXxU1UL2vrqoa9EN/hsGCSH96hyUUJk3Q/m0Qs90uvb
	+HXY7uPxkqTXBS7NpFcgKTjxynMbP91a1d5O1wNY0Ano7H2eM+ReSV+KvyltG0Jh1VFm32W7KHv
	OsYeYBDWQ+qpuKooIFDUPS/zOPotwHU3HuLRD
X-Received: by 2002:a17:90b:17cc:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3b3abd01770mr154654a91.28.1794853266130;
        Mon, 16 Nov 2026 10:21:06 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe8b263sm376117a91.13.2026.11.16.10.21.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:21:04 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com,
	netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next v2 3/3] ptp: ocp: support the WiWi revision 02 Time Card
Date: Mon, 16 Nov 2026 10:21:01 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-r2-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179484681859.3136.5472457983791141613@kernel.org>
References: <20261112163333.12523-4-ahmadexp@gmail.com> <179484681859.3136.5472457983791141613@kernel.org>
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

Thanks for catching the second path to the flash. Blocking devlink alone
was not enough. In the proposed v3, ptp_ocp does not register the WiWi SPI
controller or enable its interrupt. That means no spi-nor or raw MTD for
this card through ptp_ocp, including no MTD reads. Devlink continues to
reject the operation. The existing boards retain their flash devices.

The static board match is 2163:1008, subsystem 10ee:0007. The class and
programming interface are not part of that match. Probe resolves WiWi
against the static table, so a dynamic ID cannot select a different
resource layout. PCI revision 02 identifies the register interface; we
still validate BAR and MSI-X geometry before touching the FPGA. The WiWi
XIIC child now has typed platform data and its own matching size. No cast
of another controller's data or stack copy is involved.

I cannot infer GNSS2 wiring from the PCI revision. The proposed driver
therefore exposes neither a second UART nor a GNSS2 SMA output on this
board. It no longer prints GNSS2 as a fallback MAC PPS2 source. The
independent external SMA PPS2 input is still selectable. This is a
supported-feature policy, not a statement about untested builds.

I also clarified that devlink reports the build ID as fw and does not
distinguish an active image from a fallback boot. Unknown revisions are
logged with two hex digits. The revised objects compile and the
board/flash policy checks pass; this revision has not been run on the
card.

v3:
https://lore.kernel.org/r/20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com
