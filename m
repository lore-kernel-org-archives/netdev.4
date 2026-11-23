Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471136;
	b=ICN37/GeaVgsmv64UVv5XQm1OtZznLe4yBGwOxjLGU9BhmHPFkJcK27ZlLRBYyzO73J9
	 rqRMpQVxbugnqD6Q8P3VQilnpO/N7EgcUZWXfjlfKP4kzbfnIcgIsnSqOm2K8uq+BuXk8
	 h/7slP3hxS+Qm9BKttnAY6O4CH2/I5hKcNBWImXpPmBTqVMrfjPYhf67J07/QKmsu9j7c
	 dpyLkJVVNa7QA3vUhlNKdHbzVbRKz51K4mLe9+ApBxgp9f7dJdJ/uA3XAV+ruOWYhWUls
	 z84KXvsPEMwjqrcHJTFOhWs1ooyedvBnItjfXohaFmVHrnIP9EylBN3551GJmbKWcIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aNyv82824K8G82vZ7zobl2ETPFkFP2k/rNeZAwF/8ig=;
	b=T0VeMlReMUWtbitQDYh8wwsHDBuGoLKgXgaXbUxLxeSZBeQDbYDe/dv9kDreJgaYJoQK
	 bvXK7+RefMJ5cu8tlv965tfShjl5G6LUB1O3VJT8eO8pr6CWML9cn/Ewx9UmAiT/bMFg3
	 1LE/2DSms8+0GiDjG1IUbifevzDhgb6U0cAEtIOcqqAorQ1Q6WA/ZWgrytPuevO7YUmEf
	 ft9h0LRuStIyW+2tsI2aQeoGyR9poGLe0mh1MVv2bGg0Wvwcgah6WPdhSkb/O6+lzWnjv
	 tYz2hrl8V8DYe2U7x28vXCvduzeFox44Rb3uxoOi48QNxKevucRkW8YJhCs3JuHeNeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L+lPSpoC;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9158606A331
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9158606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L+lPSpoC
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso8166239eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795471135; x=1796075935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNyv82824K8G82vZ7zobl2ETPFkFP2k/rNeZAwF/8ig=;
        b=L+lPSpoCnQICdj6eWfFzKfs9DnjA6AetaWFFd+4tTWjcJr94dV3OF1io9GxF8Okw5F
         oCyHg65YDqDtHyIA2Dzf54Dyyy13hu46FdIIXCJzNg6aWCJgdIYzOJ0X5obLBpxwrAMu
         0BcFbEPDe0VMVUkvM6zQ8aDvyU+oDBfxf9h4zDUNiZmEYZr9YUDDTvQD1BIO01tqLnP6
         BstsegKUy0SCli5RjzTgWq2vFP/DkwSFTF0wF0zGqi1zFEAmXR5lIEFXFy3CZ9aaL5S4
         l6ViW4OiIuODmjESachCX8NOxkie39YKUntIrf+6xThAy1dKb0ZJvaQM4G1bFxiuXmIH
         MxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471135; x=1796075935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aNyv82824K8G82vZ7zobl2ETPFkFP2k/rNeZAwF/8ig=;
        b=Aw0Zsl80hEm/wwBNR8pn1IkwdJol1GEMbUlCThDxpuobrvlvxdilPEg9kglr2pRTLi
         L8UhwysjdKeWnz97OSHSKigcm9S2v2yZQ0rnKbtvi+DYriOOwYvVbM0Czux+VuDMwdPr
         Sz+hwHxn3YVfxa2cIa+vVHq8FJUSztdMuJCtbwCoS1rWuEWs/7yjDlhzWdUP4Obk7rbQ
         D3TWHqqF60XSWuX7Px0hUbDiWVbwZTgICTvTf8eyKMgOhl8XuTxdpCP0ySiqzx8g52C1
         RH4Zrm8T5VQQs7WniPj2ma6+4dY+TxwESc4jFd9zwLLc6EofdSTuBA6jzSbT5UdrjhY5
         jQPQ==
X-Gm-Message-State: APuU4Z+VKSB5v4XWxqq5rgs/XATtSLETw4qpFYykMEEyFTnd22yznE3S
	z/bYNTnNIJYtTpaADx7c6T3oSfLJTE7Q17tRYq3Kl6aku1aE7aQ64OX1
X-Gm-Gg: AZFdTZc2BwiFJH4hTGTX7hnQbehjD54c44Nb4JloXAeHyWQIeKXIuGc0m+Bx+EI6/s9
	6dV38tHYydKXHN22B03fOFrjh1CWBoGGCdj0v0vJQJIlQjrz/4sT6yS7tVwDU4rJvs7h/cxln4j
	a49TELDARLDJYSCOOPl47pN+qwak+CuZ98waA3CqQDARqh/J2InaA6/O5c0KQTnsQjKsaos0l3X
	XqckypQFOfLrz58AmxOW7WzPe8cDDcnFXphJ1zzKnfCuW8zy7Tk9b/XD/9/INhDgxPfadrSVbrf
	Wsh9hUkwDaRahxfQXWxQTKwYlAtp4WoX67lIJOGwbEtZNkLrF/4l/2mSSHbveVbeernrPXJfEVx
	0aDu0OWEFS6DFkaXMh0pKJXFchGVUGSXRYo2sHzBxNY4hAR/XCP+zv9//n+YB9n3t1xViI3Y4No
	GTiwAJBHbSyJIwsDmZ93NXeU9cbNnjLWpLjEwZbzrrwuNgWOB0I9lmnY2ieKZ8P4/QInS3UBMhG
	rAuUb/KQOeNQv+5pLsvYy6zigP1nI4wqbdRV+Pd3zO+zyKrZFihWVfdBpSKMxki8AZXjYy4kAcp
	5lkIr1ajUthdJ/Dss7znQfCywsiynyJ7n1OSWucFTIgj2SHoqYovjRdAgJllj7iD4asmgCtrnxM
	ZgEoWfP8cc6zAc8yEYhqRtAWJ/rHk7XvJoewqCdHeYqaO/aFLOQ==
X-Received: by 2002:a05:7300:f797:b0:386:95e7:848c with SMTP id 5a478bee46e88-38695e79009mr11025385eec.7.1795471134750;
        Mon, 23 Nov 2026 13:58:54 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm15094390eec.18.2026.11.23.13.58.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 13:58:54 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH net v2 2/4] ptp: ocp: use hardware selectors in DPLL frequency operations
Date: Mon, 23 Nov 2026 13:58:52 -0800
Message-ID: <20261123-timecard-common-v4-followup-x1-ahmadexp@gmail.com>
In-Reply-To: <179547059011.3135.15780033567922335113@kernel.org>
References: <20261119-timecard-common-v2-078fe69f33-2-ahmadexp@gmail.com> <179547059011.3135.15780033567922335113@kernel.org>
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

On Mon, 23 Nov 2026 at 21:49:50 +0000, netdev-bot+sashiko@kernel.org wrote:
> ptp_ocp_dpll_direction_set() switches a pin to input with selector 0:
>
>     return ptp_ocp_sma_store_val(bp, 0, mode, sma_nr + 1);
>
> When the direction is not fixed, ptp_ocp_sma_store_val() adds the enable
> bit:
>
>     if (!sma->fixed_dir)
>         val |= SMA_ENABLE;
>
> The hardware therefore holds 0x8000. With the new mask, the readback in
> ptp_ocp_dpll_frequency_get() becomes 0. However, ptp_ocp_adva_x1_sma_in[]
> has no 0x0000 entry:

Thank you. This is a valid failure in v2, and I reproduced the exact
direction-change case. It is already addressed by the posted v4 patch 2:

https://lore.kernel.org/r/20261122-timecard-common-v4-e0db4ab1aa-2-ahmadexp@gmail.com

After the exact-match lookup, v4 handles unmatched input selectors
without returning -EINVAL. For this X1 zero selector, no destination
establishes a frequency, so the getter returns success with frequency
zero (unknown), not a claim that the signal is absent or measured at
zero Hz. The DPLL core can then perform a subsequent frequency update.
Output selectors still require an exact match.

> A later commit in the series, "ptp: ocp: report disabled SMA inputs
> consistently over DPLL", maps disabled inputs to SMA_DISABLE ("None").
> That handles the disabled-input case. The override only applies when
> sma->disabled is set, though, and direction_set leaves disabled false.
> So the direction_set case still appears to fail at the end of the series
> (d6d7d7a64ee6).

Agreed. This case is distinct from a disabled input. The v4 result does
not depend on the disabled-input override: the test asserts that the
input is enabled, sma->disabled is false, and readback is exactly 0x8000.

I reran a focused source-derived ASan/UBSan test using the actual driver
direction callback, SMA accessors and DPLL core get-before-set function.
The v2 getter returns -EINVAL. With the unchanged submitted v4 code,
all four X1 connectors pass this sequence:

  output -> direction_set(INPUT) -> raw 0x8000, disabled=false
  frequency_get -> success, frequency=0
  DPLL core frequency_set(1) -> success, raw 0x8001, frequency_get=1

This is software validation with stubbed MMIO, not a physical X1 test or
an end-to-end netlink dump. No new driver change or respin was needed.

Ahmad
