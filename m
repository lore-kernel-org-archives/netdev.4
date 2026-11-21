Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795287477;
	b=L7bHhxjktaiZ2iROmiRMAmPscNDYTearA25k0RYcmcFl5NMts/9Gtmg3LItXVg9VSRM8
	 DLQVTz2EBPcDEA74OHq5fTYR++87hzWXjrA0gwFZ8+t2XJ20epu/vj2f8EeLdMs9Yle9K
	 usc1BHscp60aFFFYSZUbMTVMWtrGIf8b5bm6drWVKE3bcHgAv/TT8e8WM9tsNWLSfIldh
	 /9zyq2BbV9wWB6AqGJuDrIHrR8dme6Iy3qNcYdz5EizKMYBRcoxyaKTadXbIM4hXrOd2x
	 H3chubj6RDVF++g/+D66TCYzy3SvhSoincJu0nDVu7sxe9k56I2cfCeXc3YHgrMF0Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=B4MC1zwDtHKkfjjcvpHqhFzlxWejU3rmnKNPYLZVYM0=;
	b=yX/j8H/Gv+ENE/XS33qQ3lDA6UqCYmGgst/0gFM+tUskI3iPLujbMfsCOfJSVlBKaWvY
	 85mdgxC6HfMI5Yh4Q+sDi4b6MroR6bDmwipuFAy6IN0cJgoOWObem4102uQaUvPo8hdnT
	 hNmGDM/kW8rn099gvYA2+B2cUblOer8/aFzqJhhMpP9E4n3yMijbkRIjPebYJ5IEQHGIZ
	 TJbJA2S0hSzFrFPsBqezqsR2TLL9rEV/ADWm+wfES/RVXzfoOwOk800//feyF6eWo+g75
	 OQdrZpPvCpQw0F0snXhVwiZ1xJjJaeloh82JqjXbCEo+bGvbh7x9MStOqBuTv9chnNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="NF382s1/";
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95907606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 18:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95907606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NF382s1/
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b5d8de9619so2499154b3a.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795287476; x=1795892276; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B4MC1zwDtHKkfjjcvpHqhFzlxWejU3rmnKNPYLZVYM0=;
        b=NF382s1/VdTVwSM770YoNpdZhfUYXc5xNd2j8nNkgdUywnOATf/HJomGaGY/5fm33i
         H/dFTdWvxoMJMB8lX1VmlqMedkcl3UUFXcdCB1YnDvWyp1u3jLi2x06AbqKcfPxCnBuU
         r6izioFqXM2Lllg+eYIFkjoHY1VYdwVVh+fq+tR5ajnovXnKKKovae+Yw8lISPrqfklv
         tANItNNOaxXRRapyDPrqwEW3Ni+wn3L8XMt45r71QcccTFL+MZ4WFe5UQv2y3RbkWzDX
         KtFyeZSj8YbB/5vDjbEqfmduP1D01VI6flbhIn8h4YK/w8kwxHDLF5hi20+XUpN/ERrH
         ePlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795287476; x=1795892276;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4MC1zwDtHKkfjjcvpHqhFzlxWejU3rmnKNPYLZVYM0=;
        b=09CV/hrsY/E26iIhEwNBmF84TDjq4RLBNXZ4tCwT0S46yikCXc9169cOgrV5PTYYkC
         VyO60+Fw/WLfq+3m6gXAk1IpRf68J3b1OacVLsPhyNV+2p5m2hwCdZhncnUTiO91EM0j
         RG4UWkiU1o4LNeSoOEdANkncqYKySZcn9FuqxeJYlO14g1GMV7F1UpFvh7eoEh7q5yHg
         DRoVd67IujwRjuz0bUMj+z41rd0guOThPc9aW0Yc3jOK18uDkaGKUWq4TViwyxCjiSSR
         QJV7RsutBThyV82qL+dtLvJR/JyVfZIAEnj7X2oIv/TVFgyFC1oBamcC0cfecE+/rJ6+
         EMRw==
X-Forwarded-Encrypted: i=1; AL+hErFbIU2UCUlf1Bfew17pz61Z9mSZYh7S37uxw1xLvyyJzyzqLh2I5J+Q6OXPQCNSAZN2GGeiEI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1/1gUB07q+ShMDXQn+qdNIwmlEs4r5tJptHWZX/uzs4hitrXu
	MxFVz2bqTSaaHq7hLdcOvYsk4wkFG2SjBRbX3vUQ7pzsj+Ow8oU4RHQV3O3XyNF2UVEUtP8iV/4
	QgNkU0Q==
X-Received: from pfnj20.prod.google.com ([2002:aa7:83d4:0:b0:8b7:600a:cc59])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7e84:b0:3fa:1dbd:7f75
 with SMTP id adf61e73a8af0-4014cd4a8dfmr6376382637.36.1795287475736; Sat, 21
 Nov 2026 10:57:55 -0800 (PST)
Date: Sat, 21 Nov 2026 18:57:55 +0000
In-Reply-To: <1595ACC3A3D11BB8+20261119041113.3514099-2-guanwentao@uniontech.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <1595ACC3A3D11BB8+20261119041113.3514099-2-guanwentao@uniontech.com>
Message-ID: <awHpd6a9_S_oI6kg@google.com>
Subject: Re: [PATCH net] inet: reject unhashed sockets during timewait purge
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Wentao Guan <guanwentao@uniontech.com>
Cc: edumazet@kernel.org, ncardwell@google.com, imv4bel@gmail.com, 
	martin.lau@linux.dev, jiayuan.chen@linux.dev, netdev@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, 19 Nov 2026 12:11:14 +0800, Wentao Guan wrote:
> A shared ehash can retain a stale pointer that is recycled as an
> unhashed SYN-cookie request from another dead namespace. The namespace
> recheck alone accepts that request, and
> inet_csk_reqsk_queue_drop_and_put() can then operate on an uninitialized
> timer.
> 
> This is the inet_twsk_purge() counterpart of the validation added for
> established lookups. Recheck the nulls node after taking the reference.
> If it is unhashed, drop the reference and restart the purge instead of
> operating on the recycled request.
> 
> Fixes: 4e2b3ef19e0e ("inet: reject unhashed sockets during established lookups")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>

The correct tag is

Fixes: 740ea3c4a0b2 ("tcp: Clean up kernel listener's reqsk in inet_twsk_purge()")

otherwise looks good.

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks
