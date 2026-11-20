Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138030;
	b=ZB4RdoSovRLoREVxjtT+L0F/KBbudv2hjeDp/owHqumNrjULf8vm9wSKcGM87LBPCj7g
	 0boLvr7Pd2Xu/j5eNm6HztGwN7rGcmHkN1y5GMfV+VRruBzCdHNgdKP/7AF5NeSeR97XR
	 LxVXtrEpQa5AVVaXn4i4rLEuh6g2o3H5SQ12LkdULjD6bcHjCeP2I5YiXQouR0vSK2WfQ
	 ECNfgC9q7PVZJx/drUm/LXnj5NublLQ8hSYmvIlK4TSw8c84ONe1rfrSW9wta8B4717YQ
	 VHbYEjicvOaypQgqE+N3javDqmc32Gn0v/biQipbE6KAALYsjHju/FppsRKjHUPxoJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YPbHP917yUHY/BF57YXHo4DEomZ+zhTMb9fbIaZ6CZ4=;
	b=rM8xlC47pG2r6Uei3rHHxiCoqZy2m8DgHFkswmrjfZ70phZk6S4lbudUj61GjAWeKiDK
	 yH4c0/EChHUrY9ZUM36WYnV/ynhk2wX6aryDbMx2vOy12pqcenjm2UjQedRILdYljPykN
	 ZpPxsnX8d9K6ZETMMJCsYtvRyTOlNLViqBDKdSKlVSqm01ls5FTx1xBZyN+0nsZqIzdfP
	 eFle2NOQ2t6O8xqxgylnVOwrKuCKikYyUM6oWMXaz5nHSntNPT9lBBYUpev4NCRV5vbuz
	 UEKlWkHfoO/mAXLp/mUuuJWHaYLFDYq+HVTx/2VCIkZ5u3csgBhyBKulJnR/GlOMw+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oT5TT9gF;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181E8606A32C
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 181E8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oT5TT9gF
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso177402a12.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795138029; x=1795742829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPbHP917yUHY/BF57YXHo4DEomZ+zhTMb9fbIaZ6CZ4=;
        b=oT5TT9gFVeRsVpTIRpd7uVSqmIfR9E7HLDq2Z0TbkOyEee0JmDRfsxeBDU+HFuRvdM
         HcggF3/dyEQ8otgi5HAxGJaevGnotQqnq7jqFzIz96tQOjSB8r/6PJnlFjT516lVoRtj
         UFQ/YZR0j7lgtbQ017QIHjwf4wrLs8u+zg72Z5BNwh4m5vI+VnG9hpn8zZshlpuihvyH
         GTnutHBlMsVbpryYQYyOKJOsdeYBCVluqFoVMxhQ25lZKbZiOKzYQmdHcqDHb0QOHwOo
         8i8f3X9HZvrq0zTbebY9d0sPIJRedlPqOykfPGl73ZaJ0T36q2sWbbpBbx4ilTsirvkl
         CFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795138029; x=1795742829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YPbHP917yUHY/BF57YXHo4DEomZ+zhTMb9fbIaZ6CZ4=;
        b=rM1E+7l5z6/QwEdedhNNv3R1O3m10mHkr0A6hTSbLkJU7WnNmPWYXioyLLotWQg3UD
         ob6+ShwAN3h0jJydw2ndbSAy57mqbRI400/uHkpxl8HHP2JIQRVpyTfn6scN2ZeVGzgr
         JDpFlMfLHGT+Kr39B7ZpV7KSyEJMrK2rBmE0rysyMMfbueEGzfMhoQh7V6sqc8QmibRO
         O9IoARs9ytsRyJOfdbDDgUr39guMMhjJgkrR1k5nubU0jw1e3c1vJZE1rbtqGSH89t3h
         I2IbRQRqitunqWIBa/D+qjBX19XHhu6A6ylPG8TJ404u1pFKdTEU9CquTzmxTnMBftXB
         C5YQ==
X-Forwarded-Encrypted: i=1; AL+hErFgAKo1llKpujUk7SnB1TGov8lX8hK01PxS83xLZYTwZl+6SrS1WC11dri6q+BrMbgKcsP9tfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UoOGw9OiME4jg+0RnueZjHSkdRSu0PdcCy9sGInF+054kgqKG
	D9SmobDE9Q6F9GPnFZXmF4w6vBLYMz9WnuTkrFgtkTFbXfxBvR4nm9xp9JNQHVTXIxTOtMB6Dqa
	A3SCIzHtsl58=
X-Gm-Gg: AZFdTZfpaeTJQuuOTEnOKPDCvdp323kdc29VICPfzpk9hFmrl9qu4GEnF5mLcxdgJbN
	kzMigWnfg6BsI/PWpFMREbtTljTBlw+suR9+vSN+SdQOHdPIE1DoqqzUskY4blCgdFtaofexTgs
	KJ6OZOdCv/uv3KG63KUQ17TOR8KQ2B+ogad5zjZrNW2NWsgwIaGKBfz25XbVRJNDoux3FZKzOdl
	1gwogc45cFgtC9fcyYT/YdWe04mo4ANlhusU6Grl/vNZdQZPakA/UNRujMMkVAVhDH7KXgedlS/
	adqH5cA750k7OktedlgjBAujwtHFpWImIvZ7/Qe4jx2IdBYy6k8D8wjFvQXh849xZfdnjHZ7aVR
	TmrtRJsVLkPohtBi/vVQPDIw7N4iVHb2O06S5YbbzOKE2eSzUpf9g+o3cLkkSU08aLKRFAqn13Z
	k/jN6phvdw4OGWbfhQ7UD2VFgHQl+C+2QtKzqkgCR0nnR2G5QJNsLLcUhN8KWXHzx6RhNx+WgnG
	OD14ttT5PERQtEGvrTtUcpc6EIkVW2WNa8Og17ssRCArAhJgDWPNnTXIjFH/61hSqb0I6ivUS6P
	1MkOK9svRVAILvdW7GPzRpBykukwWHCo5fVGSo5lrYwLlk0d2k2T/TeNC7Gq2+HWJ8JATPWXhh6
	uwL7gVj3+pRxppcWY
X-Received: by 2002:a17:90b:4c0b:b0:3b4:12a9:2e1 with SMTP id 98e67ed59e1d1-3b41c931d36mr1334543a91.33.1795138029298;
        Thu, 19 Nov 2026 17:27:09 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm1763326a91.4.2026.11.19.17.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:27:08 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Rob Herring <robh@kernel.org>
Cc: netdev-bot+sashiko@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	s-vadapalli@ti.com,
	rogerq@kernel.org,
	bigeasy@linutronix.de,
	martin.kaistra@linutronix.de,
	vadim.fedorenko@linux.dev,
	r-sharma3@ti.com,
	robertcnelson@gmail.com,
	nm@ti.com,
	vigneshr@ti.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE
Date: Fri, 20 Nov 2026 08:27:00 +0700
Message-ID: <20261120012700.1878745-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119230614.GA1147583-robh@kernel.org>
References: <fd826c118aec02c06bde92ff9c20f1958c214b3d.1794284248.git.jjc@jclark.com> <179446830443.2199510.10552580927894870264@kernel.org> <20261117004133.1594972-1-jjc@jclark.com> <20261119230614.GA1147583-robh@kernel.org>
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

Hi Rob,

Thanks for the review.

On Thu, Nov 19, 2026 at 05:06:14PM -0600, Rob Herring wrote:
> > There is no other user in the tree currently. If in the future something
> > else in the kernel wants to use it, then the solution would be a small
> > driver to mediate this.
>
> Would doing this imply a DT change? If so, your binding is not future
> proof.

I don't think a driver would need a DT change. The property only says
which CPTS input the GTC push event is routed to. It does not say which
bit the GTC exports. The role of the driver would be to mediate the
choice of bit in the GTC_CFG0_PUSHEVT register. The driver would bind
to the ti,am654-gtc node. It would not need a regmap of its own, since
the register is ordinary MMIO, so the node can stay a syscon. The CPTS
driver would use the same phandle to find that driver and ask for the
bit, instead of writing the register itself.

> Not the kernel's job to validate the DT. If something in DT is optional,
> then whether it is missing or wrong doesn't really matter.
[ ... ]
> Is that true for *every* kernel version? Again, better user experience
> IMO to just warn if something is missing and continue on enabling
> whatever you can.

On reflection, I agree. For v2, if the ti,gtc-push lookup fails, I will
make the driver warn and continue without enabling
PTP_SYS_OFFSET_PRECISE.

James
