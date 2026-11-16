Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796336;
	b=BqcgzyVQcSYe07uTkWPzFLWFeOxf7MTwdx8C+YhVMUnQMAb8sS9nC9Tl6WehdYpC+8wy
	 eEPxW6Qd7AKn12zNrC4bt4eXkcarUZLypb1NeHs1EiMqUVfen32MRctf8EJ2skA+2uDJd
	 uTSGdWfGPQxY/7KsmvfUI7o7QXpJUoXFKquGlFcTpaJJRhC8LIcfgt2XT5/GfqhU5R1Lv
	 uRQzxE5BYncSZ330ADuysey+enEeVIFk+k9nSJSZgnjTTrvSvKrqZNuSZi/5GBPe2vfbi
	 CxnTh/b7opU681ZtV95Nt6ZeAGZyymYobN5HsifNq1mEJBUvkiVgL9HzLmK1q2MbwIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=HL9KJ6zJx0cYgN2NafMIfK7yVZJpUohcZPTXV+OQ/Ow=;
	b=cXCfV0fdJyImPwok8YoTHfsvtz781AtxxPWMYwYiDli+q9mVJXEnPj3ZUSrM6UA+Ln1f
	 WchNOTNGIp4ZObNvflmltyhQmf+lw5BSHqsf3iroROdF0HrcGJEqKF9AQEd3ULWNe3ixW
	 2SB5pnr3fTAYNRoCZJ5HPbN2BpSOVxbyztJp0HqHfsqR2mxaWk86t73Bhssb71nCt4/hZ
	 6VC9yN9OYNe1IT69vmmyIzIXYfGGF0+a6j2WT9uMQKeyLlFqxEz0w0nlcs6UFW0CMPuU4
	 km1eqvFwH9nubZg8G8AF+NRx7PsFT/nQ3j4WZ1MmyotsQS/H2vk60sSlKDZl4pJozdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p5qduGPN;
	arc=none smtp.remote-ip=209.85.222.69
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD52606A329
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD52606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p5qduGPN
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99c47fe8cacso2700559241.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794796335; x=1795401135; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HL9KJ6zJx0cYgN2NafMIfK7yVZJpUohcZPTXV+OQ/Ow=;
        b=p5qduGPNWYEdMm58fmgaqV+WWGO2kO1BdwPyIACIzLv+7zdvvT129FbE/bFatUg8IE
         rjLFwG17fbP3emtXYQWIvrDJb0hqMwGIX0/DqhRD7ycbV3ROoBpYtMXibjB1rUpFA5DO
         tDG1OqWUzm/3jHdAFCGuHrGmp/nMdPeWuApD8+29AWjZH4lBoXeaCdU3f3cc234gaLbO
         cBvt/m2c77eyyMKM22rxO4YukmySjv1LXhF3e2KFUX8j3Jb5K0s5csW8K6IZDk+UUIwh
         CVwcjGmRStMNa5DoQF22nmtDqRTF86YWOEbo36vUKEHD3AWiUb8xp+hBjbkksZd1QIyw
         F0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796335; x=1795401135;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HL9KJ6zJx0cYgN2NafMIfK7yVZJpUohcZPTXV+OQ/Ow=;
        b=Ar43QPKaGZBXuQJhr7oJO7Ub55U3LXBRACbCYxJb6siRm7C372J0oYg3en/8zGaCju
         IZFnumwKOC31jPAjUC2Qdjr5TXsr0E9slMEDT+DoS8bZmlrgAOa5HboU383+SbJ1P+h+
         BjdnnCuSdMB8WUcUQXKoXwLUOpR0en6cxAiL7opagbiVrJhFNY6VnOPMCm2N/mm/4TLn
         i2pnKh2VpnKGCezw7hCv4gvIxtYfsJzLfv8rRkIv7GK0Zt7JngKgkUOO5E84FiNTGkOo
         LV2tZo+rtZqZXuuXrb+4QHtLp28S1LzhLuTtjf99S/6tXdmtYuwPYJjtF9i7lzJInNfV
         Z5Gw==
X-Forwarded-Encrypted: i=1; AL+hErHtHPmC4jf7d45dfFlbfLW8ssscnQcBOWoqgOoHn9lLvNkLkYagNX01Fn0eKVKBc0qMXHaARQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DSZwE3D6R1QPkf5zEuELVXDdyw2ghkAUiYwy5oI8IHtFdbWjR
	+Nc2dulVWiJO2kcRhIgirmqNQLpnJEWSHb1tOSXrpSqby14Z//EFVCFQ7uAApu6xK/L9B8y0iBj
	5yeYPc8z5LKdw8+Rxncu4ctVuGw==
X-Received: from uabig12.prod.google.com ([2002:a05:6130:1ecc:b0:99e:b1a:30])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:510f:b0:7ad:3ad3:997a with SMTP id ada2fe7eead31-7d64d45ce68mr3464173137.5.1794796335056;
 Sun, 15 Nov 2026 18:32:15 -0800 (PST)
Date: Mon, 16 Nov 2026 02:32:11 +0000
In-Reply-To: <CAL4Wiipd8pVX8Rxkof+29iSmfoAC5tytsOh0afnovEwaZ4NEjQ@mail.gmail.com>
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
 <20261114161248.3428695-3-thaisonphan@google.com> <CAL4Wiipd8pVX8Rxkof+29iSmfoAC5tytsOh0afnovEwaZ4NEjQ@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116023211.129862-1-thaisonphan@google.com>
Subject: Re: [PATCH net 2/2] tcp: accecn: initialize AccECN fields in
 syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: edumazet@kernel.org
Cc: chia-yu.chang@nokia-bell-labs.com, davem@davemloft.net, horms@kernel.org, 
	ij@kernel.org, kuba@kernel.org, kuniyu@google.com, 
	linux-kernel@vger.kernel.org, ncardwell@google.com, netdev@vger.kernel.org, 
	olivier.tilmans@nokia.com, pabeni@redhat.com, stani@google.com, 
	thaisonphan@google.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 15, 2026 at 09:13:02AM +0100, Eric Dumazet wrote:
> This is a different bug than the uninitialized fields above, with
> a different impact. I would prefer two patches, one per bug, but
> since both Fixes: commits landed in the same release I will not
> insist.

Makes sense. I'll make sure to split independent fixes into separate patches
in the future.

> Same remark as for the LOOPBACK4_IPV6 patch: KASAN does not catch
> uninitialized bitfields. Please say how the failure was observed
> (KMSAN, tcpi_accecn_fail_mode in TCP_INFO on the child, ...).

This was spotted by code inspection (with AI assistance) comparing
tcp_openreq_init() and cookie_tcp_reqsk_init() while investigating the
LOOPBACK4_IPV6 bug. We then verified it on a kernel with SLUB_RCU_DEBUG=y and
slub_debug=P (preventing reuse of the warm request_sock from the initial SYN),
observing bogus tcpi_accecn_fail_mode and tcpi_accecn_opt_seen values in
TCP_INFO on the accepted child socket (as well as tcpi_accecn_fail_mode=0x2
when the listener sends ECT(0) on the SYN-ACK).

I'll update the v2 changelog with these details.

> I think syn_ect_snt is always overwritten in cookie_{v4,v6}_check()
> before being read, this line is not needed?

Agreed, cookie_{v4,v6}_check() always overwrite syn_ect_snt before
tcp_get_cookie_sock() reads it. I'll drop that line in v2.
