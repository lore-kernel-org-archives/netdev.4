Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641393;
	b=VSBwXN6Ly+laa1RVIFVbOJWB2kodgmQYgZRCHBqYI0S7f1OFq9/cc9m12faV9WynTSj1
	 R/QMQZUCTJcleR2WGkS5BdQiu7MF8f63mGDznIzjIJXz2nVIckiNXUhdgLWsw8MHrX8h/
	 KSvVsgQjnQ2cQ/KZc2ZyFAD+WY4UqgwQslNXekvJUPHugUaeIMd9N3atMNzA3IkALPswv
	 OA9YWB7hLnGP17aYn2b/wUN2hoQn+De9NeCvmIU1iHl6lKWCuuFACK+mbzzLebzPgqyNx
	 PPDsf1xj3hZZIWUbc2j2raY03MIFa7c6JS74mPtq8ffi6AbNKt3lxe1ju17S1cDtXBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=YscHU8cxmYbOE+D0m/M4PBQW0cNNFEC4g/fELP/11Pw=;
	b=Az2lUmtKRvRI0cdK2Gfh43wEhsww/s3R+PLfAaGLg5+/lJLs0OyKTJ4sI/yeCOPS1ZEu
	 PS/kM8ZQMG1AUsLRnzABylcSNM8OjpBkA+xVjdjKDcJzn/wtJe9LwI5gbb39yE8hdXAps
	 IJSyH+aPiYG8N1PR9bi8khyAKiAAsVSrOUqTG5dGYDTJIIca2D0aQjzWjhog/4pGdyRnw
	 5wWLBeT4QJRVpdKedm7ihiW3mnFEn1fh39qniT7XEPlINIRv5IV5lbFeyaluKdKT62o8I
	 xuklSCcDdUpKFqkI7HqIbpF1juiEThwBZWwRGLaDuQpuHp3+uOIsTz8JR2JsrlLe8qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aL2wuFjo;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB690606A323
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 07:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB690606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aL2wuFjo
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso2357410a91.0
        for <netdev@vger.kernel.org>; Fri, 13 Nov 2026 23:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794641392; x=1795246192; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YscHU8cxmYbOE+D0m/M4PBQW0cNNFEC4g/fELP/11Pw=;
        b=aL2wuFjomcsvsfQmrCeIzXmKyM/FDwAhfsv09F0lNDUgz9JuANGlYt/QreGkeMnYny
         IjWDDx07aAvuofmQ+rPn8ayCCQjiFZ6Bdr/MTVAQ8bzKhjk4bnvVo/r4h5P0UziJU1EN
         Ox9z+Lvxf57ofAOz4ukf3LyIWjuXWYozEEw4ZrAfEcYHjT2xY2eP5R9DEE9zH86bryoS
         jVJX1cW6OFoO/7PZE5PHn4fHyK+sc7UdnBCxgnSzUA6eVzj4DIA1CZze5LRqf2rADghB
         2onp8c+5TDdHjrQuNaEt48thf6zhZFVw2FkEHAyImbXRkp+VkfXGvoaK9nMxNcJy6Yjh
         vMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794641392; x=1795246192;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YscHU8cxmYbOE+D0m/M4PBQW0cNNFEC4g/fELP/11Pw=;
        b=Ug8l2U8bwKoAn5UDYn0Bn99AjXciNgJ74MrSflOQ0JWs7R5i4S/xYJFIM8x0rQs1+N
         lHq7aMbKpSTdjC/DuwrxKnbVsPGb1mfLnE54A+9PUHNHXZRGtNZKP77rVg+xCWbFcbau
         EShxpGFcb4RYiSF62EZsfdy89LLXm2/iQk1Z2pvA8qEzi9HvZ5JIN0r76Rjt3ieviV7x
         n/e0BoBJb1sq2CBpsS6rKjV8j583wDTSoWRBtdpwllVF+5DcBwxShFSYaVgDWTQMU+20
         rXeVY5F7g/qBC+hq19X0zdFSPrRZkN7ntrvESQe5GwbZF7f/hUxrA22owFMgpUMNhC8c
         S+Yw==
X-Forwarded-Encrypted: i=1; AL+hErHpCKgiqJTkIvxEBA/MoM9qX5rlG1yfuis5ah39JrZuQFALzQ5M9sADh/nRXc040mIEtTVyuZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9muQM6YCsJugGZyGiFTyVsytJ3JWzfAxdSejkAXILhk4FWY5AU
	aFIjvZxYHCbwvjJBucL84yzeDQqRoJhYFcBrD5SAuNhhqLLD7IlXlY54iZTpbzhhdT6Rd6+EJxP
	4eVIgSA==
X-Received: from pjbdt22.prod.google.com ([2002:a17:90a:fa56:b0:3ae:825a:57e3])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c106:b0:3ab:d45c:59da
 with SMTP id 98e67ed59e1d1-3b1b0a3288fmr4973155a91.40.1794641391863; Fri, 13
 Nov 2026 23:29:51 -0800 (PST)
Date: Sat, 14 Nov 2026 07:29:51 +0000
In-Reply-To: <20261111174704.24312-3-juanagusnicco@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111174704.24312-1-juanagusnicco@gmail.com> <20261111174704.24312-3-juanagusnicco@gmail.com>
Message-ID: <avgNulWmQTaUHD3N@google.com>
Subject: Re: [PATCH net v2 2/2] selftests: net: Add SO_REUSEPORT bind cache
 test to bind_wildcard.c
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Juan Agustin Niccolini <juanagusnicco@gmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, ncardwell@google.com, 
	josef@toxicpanda.com, jbacik@fb.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 11 Nov 2026 12:47:04 -0500, Juan Agustin Niccolini wrote:
> Add a test for the bug fixed by "tcp: Fix the SO_REUSEPORT bind cache
> admitting a conflicting socket". With a 0.0.0.0 listener on the port, a
> v6only [::] SO_REUSEPORT socket fills the bind cache, and a dual-stack
> [::] SO_REUSEPORT socket must then fail to bind with EADDRINUSE.
> 
> Without the fix:
> 
>   #  RUN           global.reuseport_v6only_cache ...
>   # bind_wildcard.c:860:reuseport_v6only_cache:Expected ret (0) == -1 (-1)
>   # reuseport_v6only_cache: Test terminated by assertion
>   #          FAIL  global.reuseport_v6only_cache
>   not ok 1 global.reuseport_v6only_cache
> 
> With it:
> 
>   #  RUN           global.reuseport_v6only_cache ...
>   #            OK  global.reuseport_v6only_cache
>   ok 1 global.reuseport_v6only_cache
> 
> Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
