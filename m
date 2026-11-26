Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795662125;
	b=hDHKZn3N3MgimiMYEaTE/mjtm0zdUzNN3djMceUsqYEoT0+njl6+n+y3YReaR73WMFAu
	 cCgRszR/o2LYB5vFkYfI0r7Zmndw4BeaRI+jKOKAgEhR76vWrRW390jNEuZQvg09dLMoQ
	 Y+ovwE3g1QAOKW5DNDqXOYHGu8bqyq75euKNtKrdkojJM6HjZmq2V40GHxx+4I6JjXcGL
	 sjvdk6xigmza7Wmizy44BEqgOFAsHm8VD6udUy5tMzQ1WJhlV+Bpc4i+2QcpUrjngcpH/
	 VozJ48OJFHpsnErIDMVXYmyd1tqeXCqGyu4evqoIOW56FixiygaICujjn3TL4RUM01A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Trs4YD9ebzkR8KxzgQ83eqnmWNUmqxqu7WDLYndosy0=;
	b=21G0E6Gkl9+oDOMlAh4Kjp7cWm5slmgrsO1GnBT+zFaNe5I6NZ83lxyiNe1W6Ua3eVh3
	 EPbnkhhp+HDbzqQZOb2cfS3BjBIP9H6Y6fMOR950kjTRFAi9GiaadUsjuyBqWjl1NEE9m
	 EM0bBB/jRMgplTFs8H7yzNHpNTW1ezq3kcU7hbU0DUyoIzzOdLQXMmPcDvl3+0DKKrDpp
	 DA4LqFZ8NbKJloBnKNpaGvG52oPoXs+mPP59YbwZ5r6OuJBfGunLauOj+aeXWGXjrafWr
	 6GsUSIO84NHUfTG5RmHxm6OGMnq4VTK744wJTCTqmOWngXyHglrTkgQigFjbghT600g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=luxonis.com;
	spf=pass smtp.mailfrom=luxonis.com;
	dkim=pass header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=jitGV4WQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7AD606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 03:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D7AD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=luxonis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luxonis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=jitGV4WQ
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso8625913a12.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:02:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795662124; cv=none;
        d=google.com; s=arc-20260327;
        b=ImPqWxCuyoehHQ2I/cxH/MHNcYa92Nz7HsIlopzgwoiuCZMMnLnS3K0W86vNHn/wj5
         bonczlEXwiK1K/lXvG1YGhDKLUF66BXvwRg/VEIG+yF1yTsavRXVIMpVm11n/Hpb31Ud
         N9MPnNn4xorsmamBRbvko/xIMQEro5K//+CNSRC6qZf9VYOQGMTnFV5b6nF/Ci6PcAdp
         ppZo5Y8hDjTjXj2LMelym8YZkabYGnGSToc/YG6WnHj3xbEN/jTy4FbPWpaDGLbQO85L
         7+U8hZsKfEVwPwNdS8KU+yMGcsiwBSCAaFzle7LWa67brR5Q8Zz5bhfzLplaaeglUsmy
         Os+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Trs4YD9ebzkR8KxzgQ83eqnmWNUmqxqu7WDLYndosy0=;
        fh=K7czU9t+4h0ldMMXj6tWqkWg+uHBjoYC9msL/7zEGXI=;
        b=C+eg2Z/ENBYjKAifH7cF8W8Pw6ljSf9OYeCjz+6xe24vez1ar5SDNvNjfRQ+x2aFpH
         198IiQKna6xTPLkf9I4hRWyLvH45NOvgrkIzX/rWxNdYW3jqIqdWgwlupsWM3m+1WcJJ
         7nh9UrI4ndbSUxbdl+d4G9abXP9DBnKLK/tldf8ebbjS6rvDiGP9eYGsRgxkqg4mV3av
         LjhQgXlGCFixrcL2Tozn5u9ELF77d29UNh2A3wwuOEbTqpgW4xBGLxyqF2rwFxeeCedO
         RQpG0w5WvMJibqyMze4RY8mf+eSWsOlgh1SrPVwhUUjpsCQPqvXdDuIOhIC5rh3+Z+FQ
         rzPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=luxonis.com; s=google; t=1795662124; x=1796266924; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Trs4YD9ebzkR8KxzgQ83eqnmWNUmqxqu7WDLYndosy0=;
        b=jitGV4WQr4FT3T9+W4HHzzJyqGPoVKzXEDZsfAX+ERHJSraxnN7DjvwPnhumYhOX8J
         NNeYVPbzCmSfzGl4hrZy0StzlIVw4AwGjFjooCnnvXzSkn/wjybfcuZVYB11k2cmEu/h
         m1QfeR51ImQPOnakDntv9BmpjFRCg1M/1O2BALGojrVcqWqy5wyUSovCKZqS31VUERGG
         BQ7D+FgbLAOkfMoTrd/rDtUFmaFppGXCHRs6kWd0Y6xpZzWZYSxAguBFt2zsGgllBq9X
         zf2VikZ/yZs3EdK82kprKDsiQuYnIKqZfvmazO9H/jh7Ss9Ibh1WYIn1hxqDS7qGJ2yE
         L35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662124; x=1796266924;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Trs4YD9ebzkR8KxzgQ83eqnmWNUmqxqu7WDLYndosy0=;
        b=m4gS3Rb5nbDGBgufdIXCLm/yChmtF/Rqxfq2ycaSBltesIhPP58RXywg9NXn2QNVPa
         ksAWfDCxwuzMUgEMO0vhI5C2QOeaY3vdgquECRus5CVHJ9mcY1AOphsqTwwNVaH9DZLp
         nmr9xFRHBibwocKJ3ZmKcyl3IL1Y+8e/JlZ9MAxFQUejnMzGIj42Zix4mqmnLZ53htEa
         VHeClBd/WJBcmKG9Mk+S5qTTTAkbkiJhNKPSJRjncxhUdgE+STOd0zlqojfy1PrX2Tlr
         IKA8JW6n6PrCsABejiXAtLo99YvOEfVUoD0eR2d/pjRPNaohSvjbAGopVNltrBLftuMP
         N9lQ==
X-Forwarded-Encrypted: i=1; AL+hErFgKlSje111LDDkgm2WVnVWEY8FNeVC9ZnIRQ0sd9VAbatYL03GAV6yZHNjm35Gzl4BPFwo5qQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QPVcYJJo24rg2po1Jot4lPUlnLb05QyOq7/9Ldky51HM+ggbx
	PHKUNYJX/1zo7mra/W5ZjqYGc3GBNLti2Ao8GGWJj5P5cM/MZzupAIhqwSqGYX6j65ShE2u7+bi
	2SbI3S9nDdOyKzE4HHLZKE5hfBJ/UWYe5nFPe+0+Hdw==
X-Gm-Gg: AZFdTZdakfNz3JkSN1CR1Pd9b73CHuMqtygzGs6l5K7wMs0biE1gii+9TaaL+wqEksz
	4RG3LcBl0GmsxDXlbFbsMfxRPh9/aVQGuhPNpePt9hrk8SpXvlxE1B6aM/zYUIY98uX8J98rtZj
	Mr5pLZS7AgmmyG6N0FKQK7JIToseXlfZbToYhddL22tYFwiFCXR9h8tJRTfpb60+Pk3hNIi0hBs
	fZLUXz75m4HIatwbPvstFgcjouz5/VRNckVtcClwItwSPkkQMdpQJMs2+P6N3c8EFS3MdjbfZ1i
	nhh3iXJ3W75h3rxpXCnh5NSNYdbyD0BSqt5tfGku0pHB4QGCy96yGDUwHxRe57L3ABwHdxhhH8u
	z9Ej6Uh1hsS/B8Y8tRC9fMY5x3emSfYm8n0/q9dUbgOgHV1JSOlTZPcvd2fhaTBm9Bk6W4/Y=
X-Received: by 2002:a05:6402:210e:b0:6ba:9c98:3f4b with SMTP id
 4fb4d7f45d1cf-6ba9c9840b3mr9977001a12.27.1795662123877; Wed, 25 Nov 2026
 19:02:03 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121073652.410916-1-jure.rebernik@luxonis.com> <179559320769.3135.10021676764558133789@kernel.org>
In-Reply-To: <179559320769.3135.10021676764558133789@kernel.org>
From: Jure Rebernik <jure.rebernik@luxonis.com>
Date: Thu, 26 Nov 2026 04:01:52 +0100
X-Gm-Features: Aa3M54peN4hAIHnDOSMeix5BdpvlNnY8Qphl_DV5K2Keja8xiPJqidp04Rp5M78
Message-ID: <CAD9jT+p2nvSpNJ8TA0QCJKW-_8ZV8ceNEXRTA7e6OE42RpDkhg@mail.gmail.com>
Subject: Re: [PATCH net v2] r8169: clear RxOverflow before unmasking interrupts
To: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Sunil Goutham <sgoutham@marvell.com>, Jacob Keller <jacob.e.keller@intel.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 07:53:27 +0000, Sashiko wrote:
> [Severity: High]
>
> Should the RxOverflow ack depend on napi_complete_done() returning true?
[...]
> Could the ack be tied to work_done < budget and moved out of the
> napi_complete_done() condition?

Yes. I reproduced it on RTL8125B with threaded busy polling on eth0 and
the NAPI thread starved by a SCHED_FIFO task for 20 ms of every 200 ms.
With v2 no frame was received for the whole 40 s in 6 of 6 runs on
three boards, with IntrMask 0 and RxOverflow set, until busy polling
was turned off. With the clear tied to work_done < budget, about 65700
frames/s were received in 6 of 6 runs. v3 does that.

> [Severity: Low]
>
> Is this statement accurate? In this tree, parts of rtl8169_poll() come
> from the multi-queue rework:

Agreed. v3 says what changed since v7.2, where the patch was tested,
and that the changed lines behave the same on single-vector chips.

> [Severity: Low]
>
> This isn't a bug, but the comment presents this as general chip behavior.

Agreed. In v3 the comment says "At least the RTL8125B", and the
changelog says that the clear runs on all single-vector chips but was
tested only on RTL8125B.

Jure

pw-bot: cr
