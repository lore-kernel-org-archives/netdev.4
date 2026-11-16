Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794789960;
	b=vuRFrdkg/0OsVPpHkPJmQAztnhyLY4mmkWwq5SOESySlGz4fCbLIncmggLRD0UfAovzi
	 93P4Z/pUsd9lD1CfrapvxewO8uuAHBQoCcsgfGqrBTYbA/8f5p/YTGm5/5SX4VoO3CTYs
	 bjLnSI/iaQvuehQx8as+WHJ5t+1v1KB2UQrpk21mQzO3bASxH/v/Csx+Vk5xPH4razpAt
	 t9RIq/0zZj2s5MwpnMXXLRojJ6YcbYaC0kPSWetIpXlUfDx771HV52/LAPbycYz36W5Rg
	 r378zIMHGmN67j+BhhCU5SM87jxwBmAzuB2zCgGEFLK9X32DGrfZFrjxku9iLInXdSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794789960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lO3Cr5SSAZtOZOOCaZ4gKS/kULSO6nzv/VYrrhRFV3k=;
	b=KRwiryBDilYp32CeC/EDarjl0MSZrHFjf9EhMVytiLHc/baBOMNNx4CmTCIhazYhy3uB
	 TeAp274CFyrMjxTgq8e3ly1NhIIvPp35sewzUMCCoPtO5UYsc8qxhQ8RuR8DujKRe86j9
	 EvufSv7YdYEDpJq0oS/44GOaZZ6hu6DG3HmVQC2eHt2QSHnXK6gCK6VwzK+/cdY+SvAkg
	 gI0p85/laroxzV5TR5H0iTvRcJuEDAEOflB/jGr//wzse+zK+Atw7RyyvwUajzYQbcJ7+
	 B1hE9rbhmcTFcyg+zaaCL6W2zRRPTcLJ5lajiZav17Ozgy+DJaNKlCY1PpR2zBZnK/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Xt03lFTd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE96606A32F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 00:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AE96606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Xt03lFTd
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6d68de53053so1850710eaf.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 16:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794789959; cv=none;
        d=google.com; s=arc-20260327;
        b=qnx20UnUBSOginUfUHdb15lTad8C4D7mLHY80Pk8NDe73z1PK/tuRzfX57etNJmIzs
         n5OLdvf+Sz16ljfuGOZUy5PhYlHd5au2Lm8UF4imI7RWaL9nkEZmtgMr1MMLbfiMbZ3g
         HlCfQCB6LQqOelzmANuXf9bY76HWha8QJsS6L48Uo/GTvKijT2uY8nGWEy+K000ARHnU
         +Vt7LbTW17L2doBPV59nNhnE8CIKpnfVbtpEsNh6Z5HN1EtcwstigNPsPeORnEGl1fvM
         F+MZoHM3XCHi0alRJamgHbhnkXVKHseDkSbDe+VQbvimjB04qxTLd0wAE8Bb3ud4g+54
         EFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lO3Cr5SSAZtOZOOCaZ4gKS/kULSO6nzv/VYrrhRFV3k=;
        fh=T7alfVH3V+DQSgyZ6g47srV/yR6Prwjf+ClzwqIIkDs=;
        b=X3FGZDoo+EJP7wgrsRtuGNH1bEG91duiksnh0D1Qk5JfYS6XL2iJCy126VIqFdM3SX
         fcL/B0UKLqMJNXp92rqWTdYz6GbaFcbUzCXrM8EyfSdD0kNLb5vveXSjh8zY2oiQepLB
         wejB0iXQCazALpiES5fI9b/XeLh2AzKsxdMBrl0FvXXE2amj5PhYHHwxuHiruCgPDlau
         lTuCjdu/32zxzsZ23CpMWYV9+3fSGcHJ1K6krUtKAGoylvIeIS5gPsF0T/VVuZ5rI/YZ
         DE7qMEbBv2qus6OwgBN8yLHf/eyJiISdPS2s2IEMR6e2UVRANiKBasEk83CZzsBgcS0T
         Trsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794789959; x=1795394759; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lO3Cr5SSAZtOZOOCaZ4gKS/kULSO6nzv/VYrrhRFV3k=;
        b=Xt03lFTdg4jLInQcl04vLeXF9oJW0DFBwZLBN6a6UP614RusImFX02ZlrEXXz3F/ep
         FI/p/57ji0nH0Q/LBj2Vr5Tn4kQ9X0yEFhbcaIipNU/5Dht727hz9wrlYC5v9Dw24gIK
         gcndx96h0ysM2nC3pnuIqO7q2HWfC7yPwMymAp9Vdku3yEN1V2Og7zQOZ14fDuYFsTMu
         3WKaUgWtbxJLvpq9v0jiIsG9cRZAqum8zzpd0kZsrPRCsAMjhZR7M+XVrftklhRZ3tPd
         1OzvmXEgMo6/bzkd5tw/o0lbIPVzDasw4K4X/njk7mkw7MkFiZfaLq2snUGjJCuM2qG6
         XfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794789959; x=1795394759;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lO3Cr5SSAZtOZOOCaZ4gKS/kULSO6nzv/VYrrhRFV3k=;
        b=UMi60U3LeXeO2sHKZvjh5OvMrioUp48yn9ZYOorcz1ZOsKfp4jPITL4MRtaxfMChue
         mCRudvvi4K3QR1fgLwIj7qT8UaAJWC2yClh0agvIUHzUUEeNwsfHVZRO2t9EcA6C8l+M
         QXnS8qO3jKdk0kgyNHc5D7gsKkeTc/yS9f/PxCRplFkCG2SaQoItIrq0CFaD4OAJR8EF
         Et9Wq9CslZUKpfjjjl7NrkRmq3X5xl/qhEGcvg9qO9NutWZEu7CFyTR6zT7AO6AOhjXo
         RxCFSB09Lbb/x9MBYiwtfTpLDUJJYktQS6eUnFU50h06YIDvTRkbowBOCOlXHfZHvyIg
         2RRQ==
X-Forwarded-Encrypted: i=1; AL+hErFP+X6I7O7zcQ6NuuOKeXmmfjtqwVKJh5yz6QQKzanSf/w5hq+KnOZPts2d8yi0dcJwQHAfupE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+y/RUCY6QgK+Y5SHPllBA4Omvnl3oUS9pfYv9T6Zu/F9lpGTWb
	GsyN4HR0089OTk24HmuD7LhDlNgRm7PbGZJvJiYTI6noULQY00XllC7s6R00s176YPDdGdspVfL
	ZBfUhUEJaDMXRA/NvHi6UCpCmLYtiERjEvKu1KcZsDQ==
X-Gm-Gg: AYBFou1ubCJnRrjJF39gfZqNA7AWfnOwh9qcg/WBdpFLuZtDZm2mdhsboNCdhayRSI+
	I/69bo+hAtXgeS1buDzEC5Kcbk4/ty8XAtNr8ClS+KqPRD1kYQwiQ3+17U+7u2ML3i41TyJoA+i
	b2uktpDNFiXc1j7GdT4Rf1vq91aKQ/YB8crS5s+fXBPgjPd0pT1jX34MMt21/z5OQjbhZsFbWqd
	6auYAq1zJtnC3uP/vgj5u/Hip3nXdBd07X8Lfz9stHCghgiVHgzlAi+IZb10uss6C2E0V+LLM+/
	TsRHaBN4+mLtawrwR3No/7C4WlAnif+KqwN6sx/RouyZAqsfEVmkW0TuoeXv+N5xMLCJWj/xIox
	OKJ6WnHJ5X383Od2ZU8pWzgtEwWLoGQNO6VfS/kRBWYdT7wUtcVYcGckkvy+Z6pK0hIZmrSGci3
	cobZouIzURU6o=
X-Received: by 2002:a05:6820:4101:b0:716:bd98:252b with SMTP id
 006d021491bc7-71acc5342dcmr3472073eaf.26.1794789958914; Sun, 15 Nov 2026
 16:45:58 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115214702.50817-1-emmaonana18@gmail.com>
In-Reply-To: <20261115214702.50817-1-emmaonana18@gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Mon, 16 Nov 2026 00:45:48 +0000
X-Gm-Features: Aa3M54pgGbrVncF7OWBfNtWTvVm2wgZ0k6kyExGgK-4Hkv46OrR8Lf1HTEPy_OU
Message-ID: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
Subject: [PATCH net v2] selftests: net: veth: propagate channel-check failures
 to exit status
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: kuba@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Nov 2026 22:47:02 +0100 Omokefe Emmanuel Onanaroghene wrote:
> chk_channels() reports mismatches with a "fail" line but never sets
> ret, so the script exits 0 even when channel counts are wrong.

I found three more checks in the same file with the same problem:

  bad setting: XDP with RX nr less than TX
  bad setting: reducing RX nr below peer TX with XDP set
  bad setting: increasing peer TX nr above RX with XDP set

Maybe it is worth fixing them all at once?

Tested-by: Tianyi Gao <tianyi@cloudflare.com>

Cheers,
Tianyi
