Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795286103;
	b=Qv2m8Kb3ac7ouDqjr743gprviqsmcjB8oPpbmT4R/nyPM+9m12+SG/L/osyMIaJ4gt17
	 6KBwHJL1rBnbRJerzzD6Ai0bGddNRL52xv95nELd6xB2oGXzkGyf1HoS0cWGIWtZnd8sH
	 zfW9LiPj1dxae1dat0Wdq46OUO+gv0oo90vRz6JNMBiC5LCB9bdJsNzIa+1QlDZyqx/3P
	 0ygUa77k4i0IsbuV2w4IMPPRCBPTP4PpOflOZ00By9qnx1HENb7BOrHFZa5W3bD8gElcY
	 aBjkZpYJwkpMoAvKr62pHkmiSHNHq+lXNjc53yaZYXh50tO43ZY16wAh2GbY9O3Tk6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795286103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=4kKgSANEna6VIiJcypGE8a5TeyleL9ds1EVO6d2+m6c=;
	b=395hiwP9omcjFZJPUf1c73jh+iPgwr6EpLN+DjCK5BmV1ePKyxXXjBMK5oESXeQUiaXZ
	 C7tti1gT+3MxanaZVzAJHy42KQjUHFqK9x0Ly4G+vKGElrh/yOiyiJFfFp5glFCenadbR
	 dtIXZlnA9b5TfqQ1INrqEls8O4rUAZQNWgDEEWJocZQuYIhgDYwf98sYVLXTWuzaQxMEb
	 OxikzH4iD97i+TX1YCYrA8SH0AgOgQhFI8oq3ceZRZG95hfO2Ah7ysiFeTKMFRuaDRnhF
	 fzatiR5RmT7c396cc+21Zix2E/ITuAgs/59O4Eb2hXrXjW2P/0igx+XR39WaVxkrCnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a3zTH0VM;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA981606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 18:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA981606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a3zTH0VM
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b42c3dba96so2189584a91.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795286102; x=1795890902; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kKgSANEna6VIiJcypGE8a5TeyleL9ds1EVO6d2+m6c=;
        b=a3zTH0VMfDOtA3qASaPnyRTKrbn0QPoswlB+TwNBUhyHrMnQxSfUx6JcQY0XZK4GFv
         ddqpHhn/lT88Xod5yWmMdd0jBOfshGBd4bJ4tzLCmz4ocn+YIWEdPRuroOse/IE5dnLf
         9v00BNW7ERSQF3WDPV2odW8vWdDVHs4+bin6/Q65eue9tF+EYuIDfTYGYN4en7Ft7qEz
         vot/4Uoghuda1BQrflDK9a/770qtve9526opQe2mxjHfUoqCoiTDPH8yTroT1NFHhqDV
         9SDCNx2Uj9G7wMKvLOMjyOaMwvfec7qEh6/BWqkRX+6mLuKJpht3T2zTAgF+pI4L36/c
         RHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795286102; x=1795890902;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4kKgSANEna6VIiJcypGE8a5TeyleL9ds1EVO6d2+m6c=;
        b=HFGwkuBh10SI5/NOeWN5skcZzB+kAHWte0KdBly6gRl40JrAU54qfAIQVvDlx4NiRE
         GPbcyWkKqO0G/WGphkfiWDXkvJD6KnZt8K2lopht84wNJyJO2bpiLxg9fvL8No5ZNXFg
         vS0ELFcC57RUnh0BvuNoyfun3Z5nQ3WNFNCbgyo+D8IcEHjLntqxY5cqwSMRaLYPPTzP
         qF0WryaJuo+Svzf+jJKTsuWdZ9uUNk7WszBj7Cb8N/Rk8S8PPNEalkZ37pL8eFr9Wqcz
         UXxFvlwzqPfg2aEahNRC8Vi9Kzr/8dxHv9Zk1qOVAzDasdyPVyJK9p8U2BYqXDQglfmf
         1riQ==
X-Forwarded-Encrypted: i=1; AL+hErGwacvNFLWjzmQbyF/xsEK3ugv2ZPSsn/nYUvUGEV/Hgf1Vufw6ez7+73/08TW3EDzKmz72i+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/XR2MkowAw1rFP/46bT/TrZvzCLm/CjiFFINnAbaTH3/eJEz5
	OTf14d2GN2oe0sDFN8R+8rA9DhraItekWsEhtEkfAlaKkDQ2dY+lwoDHXPJ2b4zKshTtDsq6ZtY
	cge9RIQ==
X-Received: from pjbrm1.prod.google.com ([2002:a17:90b:3ec1:b0:3aa:fb90:d203])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e70c:b0:3ac:9df3:6b07
 with SMTP id 98e67ed59e1d1-3b41c9234b2mr7049150a91.24.1795286101862; Sat, 21
 Nov 2026 10:35:01 -0800 (PST)
Date: Sat, 21 Nov 2026 18:35:01 +0000
In-Reply-To: <20261118-tcp-mtu-probing-doc-v1-v2-2-e795f20b8cfe@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118-tcp-mtu-probing-doc-v1-v2-0-e795f20b8cfe@gmail.com> <20261118-tcp-mtu-probing-doc-v1-v2-2-e795f20b8cfe@gmail.com>
Message-ID: <awHkTCbtUgkJoAW7@google.com>
Subject: Re: [PATCH net-next v2 2/2] selftests/net: packetdrill: test tcp_mtu_probe_floor
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: corbet@lwn.net, edumazet@kernel.org, davem@davemloft.net, kuba@kernel.org, 
	shuah@kernel.org, pabeni@redhat.com, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, horms@kernel.org, ncardwell@google.com, 
	skhan@linuxfoundation.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 18 Nov 2026 16:10:53 +0800, Yongjian Wang wrote:
> tcp_mtu_probe_floor has no selftest coverage.
> 
> Add a test where a full-sized segment keeps timing out without any ICMP
> feedback. After the first detection falls back to tcp_base_mss, check
> that each further retransmission timeout halves the MSS, and that the
> MSS stops at tcp_mtu_probe_floor.
> 
> Use tcp_retries1=1 and disable TLP, as in
> tcp_mtu_probing_blackhole_no_tlp_retries1_is_1.pkt, so that every
> retransmission comes from the RTO timer.
> 
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
