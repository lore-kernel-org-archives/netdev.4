Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210438;
	b=bm3sggEkS/TnRhQppFu1CsbYYQDK6emM1hvpgEfPx7IWXeuQX2K24w+J3AJ1k04o1K1b
	 W2+vnxF89RQUpYa/Ns+N7QkMp/dpfwF74pYgSp+UXtFu7EBlvVE1MX2H3whC4uxaOlkPF
	 wW2vmUsYybTCr+9PG57PXcwYOf3tSdxI/MJYdHUqI5zn30bdzNdPOXEmx8q+4pPszBibW
	 AzWXdlUERMB0Zgi+QoLTR7048++65FdjtL+a2Jl7i/pxjHq5l4kmstrg5kGZKwgNmuAhY
	 xncRdf3l5mFnBPIfyW/45wWr0En/ADzlM1wWeaNp90dlbVedglRQ9kimKd65AA7qs7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1djv/Cl6L7baYP2BjEGAGN5zEhkHq4i1i3oynSbuzoc=;
	b=DqUMYjrejckaTmnT5twQNnrEUhWYSe3ZUvdhlC5IwUxiGcXHAgETpR8gTmr290VqHEs5
	 cKDy6oQTMafFUkAQXgaStyOREwAJTwre8LwpTIdK0MKKV3ZbcmzXiL2rQAsIiijtVrFLW
	 QvY1phKWM+9lCaUkp37R8GxeWxG94uNLkEdTDjJ/kxbw0a7XwUn0lvYw/JaAwBw1p//RC
	 7miZC6qVdJcUj556ZuDutnskxo4ZXnDp1Zwm54wiQozi29oMr0q2mwrmVFnL02qcO/5XY
	 NL10tqr12bu6tWyslQFCTA0rrqgIJbzqC1Zw7mnhF5JrKjta79xSONY8PtKZg/IJEfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUB+PJgB;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CBA606A6A7
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 21:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84CBA606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUB+PJgB
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a3dd785f65so120542f8f.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 13:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795210437; x=1795815237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1djv/Cl6L7baYP2BjEGAGN5zEhkHq4i1i3oynSbuzoc=;
        b=gUB+PJgBk5EWk8aijV5j/yAhsI2yNEPiSKzIncNEtmM8AuULD6wSLdCxWTZluOzYFW
         uMFO4LFK9m4DGsLfrlAV1N9MtucGgmQaD4xDooVpWWCh6GZyjLdspa9ffjXHaGRYRlCe
         pyPzFeLQ28QT8ViL7ugWtlHkjrurLJTH4gZRCHMx1NUJfV+YjHkPgcn9wNVvD5sRJ2Hu
         SPjIU1SJ8gT8z3ofkYvh7UNm+0ziT7trdpgkXfPVt3IVr2UTuLY/nrHEgvnyhRnN570w
         GReUoSeziXHP+Q+MEcQjBCFdNhxryBtaUFnFs/V4G4besK5wwbPodpKZw5KrEyt7FJYP
         7mGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210437; x=1795815237;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1djv/Cl6L7baYP2BjEGAGN5zEhkHq4i1i3oynSbuzoc=;
        b=LFTWdlhMewjEvOUz67ZHGnXU7emev1jBl7dSpqAINP4s9pMFX6HqzkJaL4MqEGaJkM
         Zw8XUUZ8kEGR1FzgHzg7zhykTxkG5VNFW6vyA9mWB8Ni/eNUF3iUwy7FB4TvH53y7Udc
         mZv5OHd4pr2mxZGeUDEe0E87cutR++hAejTpOU0dpYkI6P3NsicEYjE3ODWWrVmxQOc1
         V+HWmCitIDI0tH6zfpNpQu2PCM5hWAMa4UBZ1yGofj8F14BkhzuHEBafdNttrYmr44Gv
         NfeODFIsYsfgsoo+LWxhIO3wgYJvmO/LA3MnEZqZ/9xyhcYMxXQNEP4bhCxp0ros8rc4
         K2uQ==
X-Gm-Message-State: APuU4Z/NgeVCClGGlDlgfqYB2zmJR41+sQnusju+K0nfxzbPEOcUPj8x
	3ggqDFjkXkD52EAt0oNHMz6L6aSRmHS9OJg17PrdOSBgTY18S0ugGY76
X-Gm-Gg: AYBFou2ZtJztYxOZ/M2qEYyjiwSjfBlOFuc/oQ7brvnqM/k11Q2e3cByD0ILrJW6Q/f
	mvL9IYhdCH9H12AX0Dd1CMaUvrQYMSO9uYK38NDeTS8QAxpHyz/G3b167l1j4Q9VsOxF2n42FbQ
	VNu3P086Gk9QyfCcvXii9DuAr6L4Y526jR7fTKU+U2vPYg1rW/FG8itMWR16LyAEIjrX6e2qGe9
	bzB6fexlKxxvgnBDkVQNsW1a6uadtsFFclgttyUBGqSWsemHclkIIQLjiUobSKpgRgE68qmA1rl
	AEFG/SgJHS4Z6xViXvMJtxAkwmz60lZD4PcDm/RppuLNBsXHYRWHJmtmXfR5rnoIAE/Yx0fWDvm
	sHSQs6O6CvZ2BoksM2akTdSMytdTGNJGboROSBKVEBmiReSltddSgBMZwL9R04uIMSGw8KGoJJa
	M0Y5YlFVzbN94LUIEuAYO4UGSkMrdCDWPXT65Ndlzu1nJfs76CCU7r/N1o77MqZxfeq3W0XSP2r
	C2PWX3ef27Mgf2KLaIN2wi4ch9uURDEyhLnrNGQY7j5ETWwVGL7az1e7OSybZnjAfQTGEmAf+I+
	dBn2DakMIV63Se2HbZG2U9ul4dwZFhuGq7ZDzp82UNfhV4rFdCvDyjWd3v6I+yoJto2/eiEO4ph
	lAo31e4AxSzVgUQ+7++xqaLvNCtUlHdXjoKhB0EjCKqa0bKep5cvo/WB4ROno7BLVJXTHhkAsqA
	CihGoRBwMG9UIPhcG2lZI2rbuIScXybu1yMC4LsaphceP1ChE=
X-Received: by 2002:a05:600c:8210:b0:4bb:7ad8:99f2 with SMTP id 5b1f17b1804b1-4bb88785da4mr97653945e9.0.1795210436926;
        Fri, 20 Nov 2026 13:33:56 -0800 (PST)
Received: from ?IPV6:2a02:3100:65ed:8fc:216e:bbeb:a7f9:ea1d? (dynamic-2a02-3100-65ed-08fc-216e-bbeb-a7f9-ea1d.310.pool.telefonica.de. [2a02:3100:65ed:8fc:216e:bbeb:a7f9:ea1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm116032335e9.5.2026.11.20.13.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 13:33:56 -0800 (PST)
Message-ID: <b4307a19-acaf-4fb6-ba3f-91f029cb30f0@gmail.com>
Date: Fri, 20 Nov 2026 22:33:55 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v10 4/4] selftests: net: hsr: verify GRO policy and
 ordered forwarding
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
 shuah@kernel.org, kees@kernel.org, petr.wozniak@gmail.com,
 qingfang.deng@linux.dev, fmaurer@redhat.com, luka.gejak@linux.dev,
 bigeasy@linutronix.de, xiaoliang.yang_1@nxp.com, skhawaja@google.com,
 liuhangbin@gmail.com, stable@vger.kernel.org, sdf.kernel@gmail.com,
 lukma@denx.de, fmancera@suse.de, danishanwar@ti.com
References: <20261117141922.20-5-xiexinet@gmail.com>
 <179514132547.3136.13495496804508264681@kernel.org>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <179514132547.3136.13495496804508264681@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/11/2026 03:22, netdev-bot+sashiko@kernel.org wrote:
> Can the single-producer ordered cases fail on a correct kernel because
> this sender is not pinned to a CPU?

The single-producer cases send from the unpinned main thread, so with
threaded backlogs a migration during the loop could deliver the frames
that enter through veth out of order. That would be a spurious failure
of the test on such a kernel; the forwarding code is not involved. No
change to the series for this.

-- 
Xin
