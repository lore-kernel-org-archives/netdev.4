Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795476440;
	b=hI3igmC/AOHi8lTJmNtMw4VB8mnJNHpXh0hgps99p0WcrpBk9ljKxpQ3l13C0mbPnBlU
	 X86YANSjg151PGpkOX68t6oxM5dB9rakv7VL2LWwY6NFkcrpibCPSN8+IRVBjd/CXhgvy
	 LM+/BY1V4AtcEB2FjruBKnDkb22kvgJ8gVJwj4Ko6EPL0yf5/pgEYJSgFO8pmeOy5Txk/
	 uVsiOpC64M5GPzAgYpi4+FyjMh59jPtuXSguBx4LLuy9AotAaqYD6vX2qM/1HjV7l73Y7
	 V/KsXM5upb+VFRfbZnWdysWYKtlrpNJEBSpsIyFokQN4YiVQXe+yx1uWR4KMIOX2nwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:Mail-Followup-To:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=MrlpIcAr71vla5T05FyN6t4TG/z1SlVrr2eAFwjUvj8=;
	b=MI3kQfKw00pQwkUfESZRb9b4e/dDSAKeA9Mhyberq8lyUchBGJaY7UxPk5PxMtfvgwl2
	 K98LjvdmldPKhiG17gY7/YgoWELwk7HcEEs4DV3w0oHAyug7fcHXcgsOzfpcqxRKBZzMa
	 cRtW0CmWTfyFYsw5orP4lh5ZLvl4JHUahw3O+9XMmckJk1CswtLm2SQjGdGHv+nzjg8Fn
	 2BBztVZeTreLUCWCHQ+VRdIlkr0EQSW9OZeDyNat9tknPR8ByvL8VKod+yRMIwBf7RqMr
	 Hsww2e+PJdv+8os+2NzIOp6iCO5zYl9VRNrIXFa4zjqqeulGj96Jd1DNKHPqHjrmugg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c6mBRDzg;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482BB606A686
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 23:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 482BB606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c6mBRDzg
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so1751696a12.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795476440; x=1796081240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MrlpIcAr71vla5T05FyN6t4TG/z1SlVrr2eAFwjUvj8=;
        b=c6mBRDzgIZ9H7GWVPY/NPFpSZVPRkVb3ExQRmZnYsMUhVj6GwRJWUP6DIZ1N8CMm/v
         IRrlLQKW/o6q8CFyf9Q151QiF4Nmnx/ouFuRYZLqeAx2zQyR9FKTsmnl+pE9/izvJEAw
         4LuNWS1Cbhh0FDHjAtH3AkhwvRnw0H5H47LPPRqyxJGgr1rWl+5fJQdVJPr+9XVX9TYZ
         DMT3/WeblE9Ly/L149xdrq8ZO/knZrAxSihN2cTrwv/ajrAm4q0JioORDvEA7VPib6+W
         Fc1We1SHbHja0aU6la3mCKWmqdmdqyrw7PrK1kBw+lHZZRnVJkwWtgVJrKaeNf49g9jN
         uuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476440; x=1796081240;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MrlpIcAr71vla5T05FyN6t4TG/z1SlVrr2eAFwjUvj8=;
        b=0G7JsNjTEzYVvPtxhQlJBq1dwtBb0sr57nGSTMAEOfi2vHmO6pTbogEQBcJQ/maSaD
         4pS/zVtUvDHLiRjaZ4OIpHJ7Sww63R/+0oY/E73TzrviRrnp8ALOKwor31QXIZBmIAyF
         rPRM0I+NiDsjcynxxUhSjlEDkSUMFrQuCQrkYtdwdVPSoVklfIiIwbSfUvS9OnYdT6AA
         2sd77FMH9JbH2yy1nyRWckd1JGAflOGVwS/M2nsoXbZ+lZk/vpckm7rAH//J8VrH1Y0u
         3MdWw0oSeT+aPP5HGqezUwoUXu0XbtfXK0x7M4CRCrTmTCmi5p8QFWiEF6QzuuiE/Dda
         kOqg==
X-Gm-Message-State: APuU4Z950fCyumzoHU++8MBCH8ZMAtWizvb020wu80y/lrRS+ObC/Wwk
	NsrUg7zhNCOib1MGfnb/Xm4tN/+6akRDHLj/Lcul9vhyBHoY+d3S124ZZds1/paGYm24/3M8Qwi
	lK8S0
X-Gm-Gg: AZFdTZe/88+UyvTRCKXButVbQheGPrt/L8zt3WUBr26k69Xh39b52r6VEc9tXxFbI31
	5oHFf5uieQeugtamtd1NjCtbxB1Tm2lSQO3+TsmyJn7jv1sYXC32ado6HO3sxg6b7BDPD8JU03D
	UcxfnlOkhB3muijMzHE9NE4iWTEZhWABMYJOY0GtWxcYj3Ryf6a0g0C/titwiqaDKokE6UaXs5d
	3XTYkTKbXjx5wpa5thWmAoC3AhYp3R+n7PDx/DUE4HW7lKPxXZL+dAwMMK7pBiL7vsa+ku1amC0
	9LtlrrqVlQ5Ka5tmlaFc6dorOAId2FVrrths/6f0ZRYEjCWjEa2WThXHLj7zZsI0duL6Y6btgN7
	1n2BE4XgHWgm595L2NJGUQMDatMM2SqMOU2PNAk72/fFxTWoDQ8Yy61G3Fl3+8JkdT38l8eF622
	1fNiJl/DsK5McOrbQWs+IZVFrZ5KtDMbJeUohAqcBp2YyEnGGrMnlTa8aeUw3tX72cPiRbyms1I
	DLWwdqT3RUWjUHb9SUNA+/YBVwWvkZg5RX91TNju8BZ30sWMhZIp5V1mPZ+nl4ZITXwBsXnhQ24
	WgqEKToN9CTgakmb3O4Vpl5PbmDhnjOH+QLHrttt/3M=
X-Received: by 2002:a17:90b:4a90:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3b41c95b542mr783917a91.42.1795476439597;
        Mon, 23 Nov 2026 15:27:19 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:5d::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b73b2b3sm8886551a91.2.2026.11.23.15.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:27:19 -0800 (PST)
Date: Mon, 23 Nov 2026 15:27:18 -0800
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
	selvin.xavier@broadcom.com, kalesh-anakkur.purayil@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v6 0/5] bnxt_en: Make RING FREE more robust
Message-ID: <awTL1hW4kH+lo8Vl@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, netdev@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
	selvin.xavier@broadcom.com, kalesh-anakkur.purayil@broadcom.com,
	linux-kernel@vger.kernel.org
References: <20261120152830.699712-1-joe@dama.to>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120152830.699712-1-joe@dama.to>

On Fri, Nov 20, 2026 at 07:28:22AM -0800, Joe Damato wrote:
> Greetings:
> 
> On two production systems, I saw the following dmesg pattern:
> 
>   NETDEV WATCHDOG: transmit queue 0 timed out 6073 ms
>   Resp cmpl intr err msg: 0x51                  x20
>   hwrm_ring_free type 1 failed                  x12
>   hwrm_ring_free type 2 failed                  x8
>   AMD-Vi: IO_PAGE_FAULT  x3
> 
> This suggests that, for some currently unknown reason, TX completions stall
> and the netdev watchdog fires. The driver asks FW to free the rings, this
> times out, but the driver ignores the possible failure and frees ring memory.
> Since the FW didn't respond to the ring free command, it is possible that the
> FW is still DMAing to the memory which was freed.
> 
> To address this, this series makes the driver stop DMA before freeing ring
> memory when the firmware did not answer RING_FREE.
> 
> Since the RFCv4, I found a third system that hit this repeatedly:
> 
>   NETDEV WATCHDOG: CPU: 35: transmit queue 0 timed out 5459 ms
>   hwrm_ring_free type 1 failed. rc:fffffff0 err:0    x64
>   hwrm_ring_free type 2 failed. rc:fffffff0 err:0    x32
>   hwrm_ring_free type 0 failed. rc:fffffffb err:1    x64
>   hwrm_ring_alloc type 1 failed. rc:ffffffe4 err:4
>   hwrm_ring_free type 1 failed. rc:fffffff0 err:0    x44
>   Abandoning msg {0x51 0x3e35} len: 0 due to firmware status: 0x408100
>   nic open fail (rc: fffffffb)
>   DMAR: [DMA Write NO_PASID] Request device [47:00.0] fault addr
>   0xffffa07ef000 [fault reason 0x05] PTE Write access is not set
> 
> This case differs from the first two in a few ways, but this series would have
> still helped:
> 
>  - The ring frees fail on the close path and again on the error path of
>    the reopen (bnxt_init_chip()), and the device then writes to memory the
>    driver has already unmapped. The series stops DMA on both paths.
> 
>  - The interface came back up later, the watchdog fired again, and the
>    cycle started over. The host logged 79 DMAR write faults in about 20
>    hours. Patch 4 breaks this loop by refusing to reopen after DMA has
>    been stopped.
> 
>  - The firmware answers each RING_FREE about 5 seconds late, after the
>    driver has given up, and finally reports an error in its health
>    register. Patch 2 does not treat these late responses as success because
>    their sequence ids do not match.
> 
> In this most recent case, I suspect the hardware is faulty, but the driver
> shouldn't hand memory back to the system while the device could still write to
> it.

Sashiko's review of v6 raised a few questions that depend on how the firmware
behaves.

1. Patch 2: firmware ordering for RING_FREE

   When the firmware writes the RING_FREE response (valid byte set),
   has it already stopped all DMA for that TX/RX/AGG ring? Is the
   only thing still in flight the completions?

   Also, once the firmware answers RING_FREE for a completion ring, has
   it stopped writing to that ring?

   If the response can be written before the ring is quiesced, patch 2
   is wrong and I'll change it.

2. Patch 3: abandoned waits because of FW health

   hwrm_wait_must_abort() gives up when the health register reports
   not-healthy, and patch 3 counts that RING_FREE as stuck.

   I am going to guess no, but is there a health status that guarantees the
   firmware has discarded its ring state? If so, we could skip stopping
   DMA in that case.

   Sashiko suggests that an ifdown overlapping with a firmware reset would
   need a rebind. That might be extremely rare and fine as-is, though.

3. Patch 5: Drop ?

   Sashiko found a deadlock and RDMA restart races. I don't know what the
   simplest fix to all of this would be.

   Maybe it's better to drop patch 5 and let bnxt_re handle this in a
   separate series?

It would be really great to get the ring free failure path fixed so that FW
isn't TX-ing memory the driver has released.

If there's any guidance on the above that Broadcom can provide to help get
this applied that would be very helpful.

Thanks,
Joe
