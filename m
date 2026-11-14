Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674064;
	b=w9QkEWy8oa5Xe1P6Kg1ek9A1xmSmpAPj2lY6WTLJSvqlaWS/PhDbtduzn7F89blTg8uh
	 QVgHG20DVc5dPHyyYqzKzN+sNHnhxLlAmbkgnoO1gsuTgJ/U21FHp/jJUY3vCCDl9RH+C
	 abEpgaUlOGScQRKOoNzKLyTKVntzfLfVEMtd0fiqGrRnNozl7qT/7gotRyBFF1mZ0JRRc
	 9SSxrtt8/B85fg92oMP40BEKCyAmBlLUbur8Rv2H4oqb7u2Lc0nO86K3gAk43dpJLMxvm
	 ProKcjNZJ7J0aWQwHPkgwRl9kjwwxFcMQSWedjgHXuFLqE4L6qH/Ya94YeaKB+ZP5zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=uIusyOIhmUCph+qRkqcgrTGen1lvnPy/jnK8ZUFUW0g=;
	b=yr4XywywewiHs6rKo1WT8cx45Ki48Ld99XMY2cwIvx5kAoMuTDLzSN1LJugCVEFL6aM3
	 hXgK4dyIC1zH8BHEmm17reDte7jHzhd/nOjAxTvwElsARaKfo3wvLwk6/F2yZzqwYAGB8
	 +Eh9hzlstHGDcJwF+kyIb7qijpOI9j8spEzK7yiPCb+E8Rmd/IpWg5poARdnEhBRK6KY1
	 LyPcC67ySHda0LD5NPUDpMQ6cBz8c7rHEarhhSU7mwSAF42wuIPprj6JapCR3l71YPqHX
	 fTJgfkiNjWFrvgDQ1JbU+KUIhz1bWxlJ9d2effUjn6jP9XrkJ8RoyE5OU3IDaW/bgeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6FERMf3;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8EF606A894
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD8EF606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6FERMf3
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so2314050b3a.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794674063; x=1795278863; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uIusyOIhmUCph+qRkqcgrTGen1lvnPy/jnK8ZUFUW0g=;
        b=e6FERMf3c3yD17BhvoNIpWQb4t45y4DIJCQ7OY3vra4DI0ay8y/ksjW3Y7VLoFySG1
         Z8og4d0qXuFTYi6wVdTsH2/fpl8pdHLA3TU+3K/xEtd/iBXFRX+7u6yn5IUovnzvVW44
         Flx7ZK6fRYplHSRb/2KrldN85TLfg+tKs0yiVzXJP5eVcI4jUntt0aZrfiZNjAlqdov3
         oJfznTuyHQTuV4U87ABE1tPqnmPwqj9kKM8OEtREOEapq6RLaqYFO8Lgr/V6S5AH73pb
         IEtXE4+3CHIrdshJZsMMd6VViw2FjZr1T3+0D4Fy/ezGpMA01VKBst4MtPZSG1sDeMTs
         8nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674063; x=1795278863;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uIusyOIhmUCph+qRkqcgrTGen1lvnPy/jnK8ZUFUW0g=;
        b=AFNcIBeOEW6xaFl0v+xpYy9F5/HAkR0L/u3q7xDT1FbgPhJZ8qQ6hmKcL2ovd2SbMY
         SmD8vVL9hd4WBgXvMfAxbGDYvEfOe4vmhpmYZb7T+6xtBsDaH2PpvgUC1B92bjquEYbW
         uCbMF+7X7EkkmvonhIEDT70U/J/lQEW/tozMrEHqCml4adzVNzMg/cSaZfEvNsMwIoD8
         lTu1XBEcBrZdY4BrxfOlN0JX5xYgD4D15tiGSNWG+qKNeB4125kEuARkZXUq99+tk6Ce
         XjbkSG0nj5ogOQymuZf45aIDU7Oxz+44x9dEMvW1Bj9r/t9C3K47xZnMFKPcHU7h9O34
         VhFA==
X-Forwarded-Encrypted: i=1; AL+hErFgnw+PzhvsuppvUDagkezTVaBUAGEGN91mJ96oRsKj+o3Z3rbtISqn8spF9gbHvyQViI3Al9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dmryTUnP3jcHFMo0sjs+qzc8gIL2QY1LHJ0PTTNYmcvBLCV+X
	Jt84tm+eh2twCoLE7lnqgiabUocmRcTKi+tllud80YMRhuAsY5ApZhDZ
X-Gm-Gg: AYBFou19mRF+RxRPAAbL+zaxE/YYjTQxBHiVdADdBlW7lwhdRklwT0iVTyPF5qptLYh
	Hin+Hbvu6uTk0QoihkGFI4TPP8HLHaWHATe8n70fX5+FZFTyoBakqW31lbgEokTgI/vstJLURjo
	oXSytlzh8105ysUuAQBQKdqVZBQV5GGaF1FH0OBKiu9ogdoQ9MFTZ7p3/HB8PAy5DNVOEJCvhoL
	M6Yu0pbM9KGwGB0LD1enTG++ZMcKYqv+cdaOBhcgW3WMZkdmlv+8zAIfZ/nMy/PjobxP6GKc57Z
	ZXARR79l1Z6g1syvlL6rSWqSBQz3H3/9hMCnK3P4unQjqUPYIxqzaZlQB94sWeeeq8DyPdFlyJA
	W47aaXAowo7BKg/z1bJwiWakNJpAnYnz+7pC/fZJ9JFd1Wmu7jBq/HiyJ4mu6HWsQM4pdo7C+m0
	ZBC4ZKVIEf8B6Ehc9t+DdGmR6bhpbCTanqRqCvmccnX+dC+QCcDjEw1aMsAqCar3i+1SSOUPB2T
	F21cpW4g2voVcmWQNqkEWED5mkPY/3CfpvZdtNG3KLwJmme1TMQlmIUeCnjg4rwutc9lA6NIByB
	E5jtVAC3zRF7sPmudQjS+KU9qGu3ouN8wBpKNAuHyx8KkU+NvhbAETqolZVHnZ6TeGL1mSZ9DsW
	xgCTmifhRLj6wtIXEHLh3XbcDEIB/iWTOUw==
X-Received: by 2002:a05:6a00:1ad3:b0:89e:fe2d:abe8 with SMTP id d2e1a72fcca58-8beb3b3d902mr5766668b3a.8.1794674062835;
        Sat, 14 Nov 2026 08:34:22 -0800 (PST)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2b190cfsm2173447b3a.51.2026.11.14.08.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 08:34:21 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 16:34:20 +0000
Message-Id: <DMV2UXIE0LQ9.29AJR2CMSPH67@gmail.com>
Cc: "Eric Dumazet" <edumazet@kernel.org>, "Neal Cardwell"
 <ncardwell@google.com>, "Kuniyuki Iwashima" <kuniyu@google.com>, "David S .
 Miller" <davem@davemloft.net>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, <netdev@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bpf, sockmap: fix cork data loss after redirect
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>, "John
 Fastabend" <john.fastabend@gmail.com>, "Jakub Sitnicki"
 <jakub@cloudflare.com>, "Jiayuan Chen" <jiayuan.chen@linux.dev>
In-Reply-To: <20261114115222.180345-1-omermetekaya0@gmail.com>
References: <20261114115222.180345-1-omermetekaya0@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Nov 14, 2026 at 03:46 AM Ömer Mete Kaya <omermetekaya0@gmail.com> wrote:
> In tcp_bpf_send_verdict(), when a corked message is redirected via
> __SK_REDIRECT, the cork cleanup path unconditionally frees the entire
> message and sets msg to NULL, even when only a partial send was
> performed (tosend < total msg size due to apply_bytes).

It's fixed already. See bpf tree:
commit 13c41b87e4a7 ("bpf, sockmap: Keep the rest of the cork after a redirect")
tcp_bpf_send_verdict() puts the rest back into psock->cork
and goes to more_data.

pw-bot: cr
