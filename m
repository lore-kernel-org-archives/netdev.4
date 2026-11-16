Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796277;
	b=XLg3oHcL76MtkKcPXQuzl74mBiTlnDUpOYwT5Z8RDBedZ7p8tUECcTXmqmHO1YGrDMk1
	 0+wf+XQ4Fm8p0scq/W+HuO3/bOENWQtTmzx23PxKVUKO7ElvI/czpeHuIzF1wpxYpAGVD
	 RgokkXmHJQBum1eeIHOVD8QejCHH+zzbNd+G3xMw6Ca0jN4C8uJ175nVit9ylKBJ9JDHd
	 ihb7xfzlFO8jEuG+cWgsu/vpxpopZFgzumdW3baOZDxVqAecLs31eEvedy10HotO46Fk2
	 xVSFSXBEX0nAGfdmZ/avutbDC5A4WzpP2PUYhBFAPmymMVGhRKTvmCR1qFXkj5ACUgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=FKvjlHRiAkBBGldi8tqyRzKJUO6RZBtUR9E6f1vPWnc=;
	b=ErApH5LZJooPXYV1aEuFpPlxLl0gZPUoWRQHwbfoqthWkaWAg2ADP71Nsprz7O3Yg/RN
	 irK42+OxwFoK9dE0H7AdBl8JCtXNkQSPswHESA4A+rdnHvu6aAQY1g3UKSxtSBY1/EoRI
	 Qwt6zORWMocsIfSb7jydPFcqqyn+b7NZIDj0oFs/ZCHZaT+5soUlx5hws4SmiQZauNyJT
	 Vx0DdA+jpLBA+7KhRp5s3Q24prFdHcd7lhKuZPGvMfkzlZOPvQATmCcPVVpnHvxoMOXuQ
	 x5xFiP1fOqp8ww3jkmN9Rj+n/4ZAcOptiqJV7Fhp6U4YOKe2wc5OAfEyKM5BKI+PHxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qQGkvwKg;
	arc=none smtp.remote-ip=209.85.221.200
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDA8606A31F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBDA8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qQGkvwKg
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5edf86a8c00so815136e0c.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794796275; x=1795401075; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKvjlHRiAkBBGldi8tqyRzKJUO6RZBtUR9E6f1vPWnc=;
        b=qQGkvwKgwAzg0VnMZ6FFjeYVUpUB4G4gESIRB+Ywv+2DN09rzQiGU8vUDpVFIWU1S1
         ZuAvM/aukev+kpYmOin8pWhcjmyM6SNl7u65+t02vJhqAt5JIBe/Y8KwgmncnZEjogAR
         HCqQutGR8HYJY4jhJ0y+6fw8KhNNVpAAjXYhCHHOGFkWZP3P6kwyH1UPqajZaXMFkt04
         iM124aJ+XvWt9dXZVP8oL7pqAtWAy5tgqdV1C7A9kr4WYwIDIOiWRQph5jovxFpAFKfF
         M5xRDTpLrt5sRuymBZ1WQnEaAgTTr7HWmow0oj19uSqCkFhG/DPjo6fyAbohq/YmSWRO
         75aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796275; x=1795401075;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKvjlHRiAkBBGldi8tqyRzKJUO6RZBtUR9E6f1vPWnc=;
        b=PfCGaBYW4zqFpMlMHzOK+s6hrpOMobe9ueBXh+lcaY6zFbB66yYTWlDFFnN2iT3370
         AQGZdaqfPRjbsieLWNh3SgpHz05YMlLwF21cz9mXK4NXwPmlJxig61PaFj7uTJ5hIeE0
         teDE02aewueMWEsuvVmbYmwBWe7kllbEtoF1CGZH1dAOopCrZYhXPuV7zot7PxUMFG+z
         Jx+56xFHHOpbFoZMKKnMMf5RQtW65L8gCR2AVPatk47njcmEhHQUFJLiIh03TfNit8zm
         Nh2daJxILOvcD1EEJp7UWhzgd9oWFDRcRK+5I9SE7xxc1Yjt9vwDh1ij/cqGHOD/XUQ2
         fBQg==
X-Forwarded-Encrypted: i=1; AL+hErHjQCCIxUCWKxe3pxT7YTIa9l8FDjDS1GUc71lo4ZgYTxAu2E7e+zn7EJ6Q/eUu9ItJ7zD9e+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aabpezv6oWvT0cYVwGrX5OlFIytrCzNyfEmGuKR57le3nQs/e
	sfkha/xqvn9CIjoKPMl71pY4PShOW5Fd2b7+S3dHZ3a2YPlroQqhGt1+jAxr3+H2Yy9rOnYea3I
	xuvBMF1u4hdWD2TTB8u/QhSVOdA==
X-Received: from uapk12.prod.google.com ([2002:ab0:734c:0:b0:99e:2b39:a3b1])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:2922:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7d64db3c827mr2441486137.36.1794796275267;
 Sun, 15 Nov 2026 18:31:15 -0800 (PST)
Date: Mon, 16 Nov 2026 02:30:29 +0000
In-Reply-To: <CAL4Wiioi-t+gKL3dLDWcTrd57tv9TEoXUxh8gHjCQSDyT7Xxyw@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261114161248.3428695-1-thaisonphan@google.com>
 <20261114161248.3428695-2-thaisonphan@google.com> <CAL4Wiioi-t+gKL3dLDWcTrd57tv9TEoXUxh8gHjCQSDyT7Xxyw@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116023029.128997-1-thaisonphan@google.com>
Subject: Re: [PATCH net 1/2] tcp: initialize ir_rmt_addr and ir_loc_addr in cookie_v6_check()
From: Thaison Phan <thaisonphan@google.com>
To: edumazet@kernel.org
Cc: chia-yu.chang@nokia-bell-labs.com, davem@davemloft.net, horms@kernel.org, 
	ij@kernel.org, kuba@kernel.org, kuniyu@google.com, 
	linux-kernel@vger.kernel.org, ncardwell@google.com, netdev@vger.kernel.org, 
	olivier.tilmans@nokia.com, pabeni@redhat.com, stani@google.com, 
	thaisonphan@google.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 15, 2026 at 09:06:59AM +0100, Eric Dumazet wrote:
> Nice catch, but KASAN does not report uninitialized reads.
> Was this KMSAN, or did you notice garbage in the inet_sock_set_state
> tracepoint output?
> 
> Please say which in the changelog, and include the report or the
> trace line if you have one.

I should have explained KASAN's relation to the bug better. It was not caught
by a KASAN/KMSAN report itself, but originally noticed via an out-of-tree
socket hook observing inet_sk(sk)->inet_saddr != LOOPBACK4_IPV6 on KASAN test
runs, and reproduced upstream via the inet_sock_set_state tracepoint.

When KASAN is enabled, SLUB_RCU_DEBUG is enabled by default, introducing an RCU
grace period before freeing the request_sock from the initial SYN. Without that
grace period, cookie_v6_check() typically reuses the warm request_sock whose
ir_rmt_addr and ir_loc_addr were already set to LOOPBACK4_IPV6. With the grace
period, cookie_v6_check() gets a cold slab object instead, e.g. (with
slub_debug=P, expecting 127.0.0.6):

  ... sock:inet_sock_set_state: family=AF_INET6 protocol=IPPROTO_TCP \
      sport=59839 dport=41050 \
      saddr=90.90.90.90 daddr=90.90.90.90 \
      saddrv6=::1 daddrv6=::1 \
      oldstate=TCP_LISTEN newstate=TCP_SYN_RECV

I'll clarify this and include the trace output in the v2 changelog.
