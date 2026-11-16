Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794834514;
	b=4vnf/AxS4I8r4M8z4p4jWUpG0TzCw5kZh3+h68TeogcC8m/MCdfdYDTE1UQX2qL23RQz
	 08zXU+ORIbnVoQbUOkyGGIkcL2DVfZ/WiL1VpnQ+vNU3hLyKhse+MqtOKUuKrCwO0NEEQ
	 mmiD8/inK8rWUBwgSGGHKr3oT8f6nFEqTLbHU8oY4mnHVvVn+Eae+4ZXwtoxYGkotSq1j
	 8mRrHXYOAIPJtV7lcWE+13g98qRfhnEwGlesB5gHKLFbDkZfP7kN1iHK8zddNKx5pISTc
	 rExCy5Qh6uY3FL0oT7HLNl97S4fAV3mmJglc4rHPK6g7i8vpsHxczp/OvdOyNb/wTkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SJJ2qpANvyTR8K9yLqvEvSV/pVuGUPXCU9gwVqvlEl8=;
	b=Cet38Xq3DQMCxVvgZnDr2C3nGpf0tB2ZK7UShQeJpy37xYxp4aeAWvLDo7RBQKinyWXn
	 GzbCG/NmZYOtH/vIkdPSpWMXcsBn8Kyl03VPP6iVaL/DyB4RDaoEoixgELOGIInVlzpyG
	 y4e3TFmCnK4LGR9cA1qqYm2dGMiAtHhpC5x99mybqsdCgxrfplxW7923B8YQwGudygXSB
	 PAxBsipEKXn9cVybTKT1t1diwIxWKp1tHrxraQefxK4NC22Rzff3h6tU7tGEkAW87tUQP
	 zCek5aAJMYpVUjq++zor/ZB6s1z28xVlmjbziV4OfR7nXLuUk8WeHp0iF5jpUvOhuEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=PnAQWxel;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EC4606A337
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5EC4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=PnAQWxel
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-71aea92f666so608110eaf.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 05:08:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794834513; cv=none;
        d=google.com; s=arc-20260327;
        b=TbCCTrKMaoitYLvenjW75pLOviPQAwBXQmOP3UKUFGJw9cy/a0Hk69i9yL/RjFYPh9
         Dt+MgOXPQEazlPH3U1tF7a48v6WEyMCupffuF1iEDzBydX7WZqnrOmfvo6I/3KCrxBBO
         ruOuxs640L2WtlZNdPN528vcktCiSm4RkF/aC7dTK/6KQVQh0CApmn847sbMrTitpu+1
         bd6BwSlma9GB08XXSb+mPJY5FqJLmfWBw7bSQi0R7IZfsE7jdwKRrJ3ipK3hN/ewLYrP
         EbO4kU2PHiCA17mJfuyi/vAT4Di9kh0B0yh8vH8GKZ7CqvJxHtOjgN3bpnQgQC8+sBYO
         VWmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SJJ2qpANvyTR8K9yLqvEvSV/pVuGUPXCU9gwVqvlEl8=;
        fh=34qlYoY+ZSwMqloBV/k4nOJ8yxFsaEmOy80cgd2EpHM=;
        b=h2RSjNZyZ+B9MlazRzhep4VCc8425GKhH/BoP/NlOXFM1e0EpSg1ng3Juch2m9ftft
         FY2vRGp3xafWf2Ajt40D1sENY62Hxnd/Unk5QKMga/CmQb63wqEr85FHf/c4QMt3u2nW
         HBnGG5uBAEzcaFJJEj7++mfjkHVhxSkL/bl0umHo5nm5l31h/NmS/lQ6s+EUck7gFjLu
         E2Ymz37UhBVAITIruETibQLl5AfTX5VcIlrGR4DDazKSubO2+/FW7VrgsZNlH4c673ih
         M96b7I4a6mqdQzG1OYIoPA47sQPl27NPHUiTUew/e3TlIapBodnvS8mUJim/pd9oSFSm
         RpQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794834513; x=1795439313; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SJJ2qpANvyTR8K9yLqvEvSV/pVuGUPXCU9gwVqvlEl8=;
        b=PnAQWxelMKwpd/v8tbVyyOErhLwWUPNbTk2/4gueCFwPgYw6eHD6HmaM3cU08ZM+j6
         oa5z84SDbXbMpZF+YkdoogskH90WSyO2Rh4Sw54JrWdnYU2ENifHszT2VKQRClf/mV4k
         M6fLcrjpThvrZs59s+qKwl9uT9gWAo09lPVxe3keTMIesHftOhFOnMXBoTQoKklyIwpu
         8xcVN2djQ6sruVDJvP0WoKsKGqpL+A1PFZ6/qAdLf+9fyy2wE07uL2z2G2z+kbl/pSDX
         wohfgUgE3Wu4jCDfFixk85aNjSVvUrsuIr58jeTwo715+6AV7uFFgbcRxPM1CXiTWWqn
         AUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834513; x=1795439313;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SJJ2qpANvyTR8K9yLqvEvSV/pVuGUPXCU9gwVqvlEl8=;
        b=Siei2Eh/l6vkYf4w3zbtmUIpc6bN5sNCXOXf9fe9Y/MUAuPJ7c7RhR13ETnAs1dKrT
         qKQbpbAJn7dXU70yVrNVDsK1k4yEPfghVEGA/WcHu8WlDBb424Nvj+iLm98rPgw6R/GW
         TCKpmrTAb2vyVWqrVitKyYJ6NxG9MzbmiL4Kidf6U43SUA2PBG7FnRbjVt7rctnjre9p
         VdPaURG0PO0ybY39RYvufKQCln0hZKnHI1WhBzYugssReoQbsalfcaXMktaQa+pBA1Fe
         E4qXZ6JHwKWD8/fRIMVHNuwwRBcNlBYQSQiZ/5oTYYXgEdNLIg6TRwr2+EKqfqs1owjh
         eI6g==
X-Forwarded-Encrypted: i=1; AL+hErFHV3rW1YN6OK8KLxkJHBs8BNAs7jGftzDe4r+hyr6jkeoR9nPawKsy8Dzl3Eknex6czE2Hb38=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e2ZyG1I2NRlHY1dMaPh9syMX7kFeHdH7YpmOnVmvmEpfwKEwn
	UhoJmWvsCFT7dcQmzJeEZpOGnkQU4rpFaeynwTVXrnkdKYeqkzWVt5uhcLZrRMLhnUTpQjuslMS
	Jmtht7TtuxG8wSsQNpyBXn1yXVzlDpGAgFIuhya11RA==
X-Gm-Gg: AYBFou3r4p3BvEW9AICa9Vp9ud3WKlQETpAhwy4C6rlmshtUkbV8P+KSiZ102VurHui
	icCtmpKBoeW6+Ka2bejkJI7tSUr581Dy20mMa516xqDy0uEH+ZbYf4AYpw0RT4ObKL8IbE0rd9d
	Zh7UAyGdded5GOoGBHS8DEDlf4FD3VU8WON7pCtqHvbX4/bHtnA9QVqUFx1zUtiPP3oiGtgjZU/
	upKnoyK4fvVv9sXaAMTK8HBylERuDl/ZFb814PA4M0nOh9MxEdkeZd3r9iIV5gZg9eO5l9W4Nex
	gJ71TOW7EGqjihbMXbIgEzT3X+ZF2h55r6yLAT9XtRtORJ3ytxKuTvlg06UdeHYYS+if45ZBlg+
	FvLIwcP6yReJMWqe5wW4u6jPG0l0ViqqaG9B4L2mUWIgpmN8SdR/q+X7kHnG4L72dxD80WN411J
	99k5ME+2LE/Q==
X-Received: by 2002:a05:6820:761a:b0:70e:78ba:1193 with SMTP id
 006d021491bc7-71ab4f10ec2mr6796326eaf.27.1794834512803; Mon, 16 Nov 2026
 05:08:32 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
 <20261116084107.6675-1-emmaonana18@gmail.com>
In-Reply-To: <20261116084107.6675-1-emmaonana18@gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Mon, 16 Nov 2026 13:08:20 +0000
X-Gm-Features: AclHuK8ATNHdUFf-g1l7OKHnDpIsGdknxqvgkzdQ5Cs4Ojj7SzQBhCC284Pvha0
Message-ID: <CAG4wq-fhK3Mav3vLFUVYZhiXy9oF4CdazxkbOK2NNy7-KoLyXQ@mail.gmail.com>
Subject: Re: [PATCH net v3 0/2] selftests: net: veth: propagate check failures
 to exit status
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, kuba@kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 09:41:05 +0100 Omokefe Emmanuel Onanaroghene wrote:
> Changes v2 -> v3:
> - Add Tianyi Gao's Tested-by to patch 1 (thanks!).
> - Add patch 2 fixing the remaining three checks.

Thanks for fixing all four checks.

Please be aware that it is recommended to wait at least 24 hours
between postings [1].

[1] https://docs.kernel.org/process/maintainer-netdev.html#resending-after-review

Cheers,
Tianyi
