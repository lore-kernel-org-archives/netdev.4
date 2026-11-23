Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415460;
	b=YMAIy3NkkKCAneuKC3wtIOIEZoIAc17TiNQrzRuqj/xEyhpjjXIV5Mk76iEmriFp3EMM
	 +BLoWSVGL7IFWv6WdKu2h8wE7gNv92TTFLRVxX9GTVAwVOgXjvPvh91NMkhC93Rfy3AT5
	 zcRbyznj3eMMALEBqKOVMj/cGS3uXOpIfe81OnOUqsL5B0YfMRWliEZotR7a/JQwvNaYf
	 O78u6LjsRm1tYHqAUcG3+zO0JMW9OIWm8Rbu7/AfHv0ym1T+k8Ug9aEZ8ZJcdAVR28Gyf
	 0gbL4wGNIxCoygpqQdZBw9bBinC8YYEzO0oBjcwDDH03zBp00O8kkvudklz9hgztmNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FC41BXf4VJWZQyWR3Sgt6XorZQrlBJJIAm976pUKW8M=;
	b=dtgfMN26xXTl4wA4ubvUaCyXk2M+xw3m5pA/I8a7ELqMjwZkZzxPAG3kDLtV3G6Qk0Mu
	 u3NaT/jQbcjrkCHDyAVYzIFJaTwUhn8PlEP26lgDwDQauynP8KLEK5QNyKizwD5yshL3F
	 JrqlXgZ+e5uzOuezCTIr/AlroCF+sVwCPJpLBP/hv53xJbr7xkkqPE70dscUjY8j5doLq
	 cpKjGZ6+rw6rAYiqWpvI71uIsEyr7Ei1Ih2lqwwm+6io8WQlWjKquVsKyZdUbEjXfttEI
	 tSlqqTsDgJFngS0xTIFnZbvJk7yuUVE4dsz7K3LOktv+IcD7DsabrqQ62ex9KmE8eVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MCV/B79T";
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD69606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCD69606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCV/B79T
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-98301b325c4so658851241.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 22:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795415459; x=1796020259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FC41BXf4VJWZQyWR3Sgt6XorZQrlBJJIAm976pUKW8M=;
        b=MCV/B79TQ3wl1OdvCn+/05GbGxrnVvp2GCl6elyGMM5cDPlxm2MBVUl8bcJfQDByqF
         lmvHk/8pHxIp+YJE2XJKD8h0Nr6+Pd4DqEr5K9dpkOoPI3v7nWIlY931RtjgledVuQZ+
         /tEC+dmRnWEVAoVyYXKuLj05ole/RaCJ0u4XtErdhr+Js4VXQ3NlvwBJ8rJIKYwRo3lj
         Xk8uyGtHpzrzzw33YW/TGHQgGQEdja04pW39IadJ03Zvd2XtAsi8DCimddQuy/AkVHxs
         LtSIypsXCTyVkipJWvcQbBBKZ4WehbcQ4lu5569txprj4HeyGNLejCAtWTOl3X8Birj0
         D2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415459; x=1796020259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FC41BXf4VJWZQyWR3Sgt6XorZQrlBJJIAm976pUKW8M=;
        b=kqABiz5AAkoaS2iFxgWktVUzIjc2apqrF7V9bggwWsQ78dZYFhmWxN7BSKchq/zn2o
         pcjeAW3D17/OGdOCtk3mEaLmJd/kdyOO9MiurUe5Zix9VjInM+849fexpDTFUwPZEmIN
         8mIABq3U17VBJwpXcwWqyKr3r4KR2SP9sgiGFwDqrlRZt7v+l1R4SXuT4+h6l+lZMMqb
         Ypvsw0v/iNIQeaGhdqgXJfQ8S319HBdO9n4BnclaZJKunHYhmEqCMIfBh9PZGqVBEI4O
         alxBMw6EaiYQkWid0UKwD1yMCAgp3PT+scvzX7KuWzYnvB1t7KkEUgEa4AuzB8rlApDW
         RSnw==
X-Gm-Message-State: APuU4Z8Q1PNQJPD/Lmf50YTcPcfss67Wb0B5Muaaxae0jvXaAs6qrjb7
	iQTzbYUjC4pTeaSZ9r1UwCrrs5XIQ0f0AaYSpxL/bgjOIlg2vbtcGg2m
X-Gm-Gg: AZFdTZeUGrwI51TRDY2FasgIiAKJciDgcUuub368JbXBpiRWys0qpMJyFaGYvDw6W9b
	vfevtcatHwoleu1lEMtb98kgoGwBUuI/shj8cyQRucP1tsuI0jHP8AnBk7cMpij/cecH1mFrNeE
	G+N8wUYyngWH13tZOIulHgnHKoSJLB4UT3EZ0uWfB3Yh9zLMKldUwEuK8cAXM3YTVyNPWLMdWJn
	qJQO+xOIkRvT1VGiMgwzBNySvnDidw45kxHf04/9RLOPrw7zt/694wola0CYynjpfdfEKitEf6P
	33QA7bsZWpnur0JA3z3jLvf9fn7HtuuOdpj/IOxqnWZhKAGOcW7eDAXKqKxthK2hTX+YfmEDSqm
	yuSFNlE9qlmOXRDgODdY4Ft1j83JmI+RWCsALQ+SLJFQJZxo1h2pdONMJwsQsFZJ1i1y7rgOyo9
	vN08DfkTDqsGYHBlr1hUtowXqh+LD5iFE6n7xv60a9ldTBz3Ma56k60rcv1HfOnaW0u5fkrmkzQ
	NSO1GUBf/2zTU27Y00ENlkCdZOd4CLvfN/sfvvsoQF0LTeQVWnqSan1/m0fpiCMaF5m6iaRzfxo
	D16RjyTWumO9PcH+eg0a+NAZVkcxHbfJd+52aJB66MIFvH0dKSzDxJ5H+aEQ8SdHL08=
X-Received: by 2002:a05:6102:8097:b0:7c1:bc57:c7f5 with SMTP id ada2fe7eead31-7d7393c9b97mr4057528137.12.1795415458558;
        Sun, 22 Nov 2026 22:30:58 -0800 (PST)
Received: from MacBook-Air-91.lan ([2603:9000:d440:53a:10be:9c04:cd21:d4ba])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e822a085sm10595144137.10.2026.11.22.22.30.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 22:30:57 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org,
	Eddy Tsalolikhin <eddsterxyz@gmail.com>,
	Kyle Zeng <kylebot@openai.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v1] tls: fix ring wrap in sk_msg_memcopy_from_iter() after splice
Date: Mon, 23 Nov 2026 01:30:55 -0500
Message-ID: <20261123063055.58813-1-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120225720.89044-1-jiayuan.chen@linux.dev>
References: <20261120225720.89044-1-jiayuan.chen@linux.dev>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 21 Nov 2026 06:57:19 +0800, Jiayuan Chen wrote:
> tls_sw_sendmsg_splice() forces sg.curr = sg.end after adding the
> spliced page.
>
> The following non-splice sk_msg_memcopy_from_iter() is a do-while
> loop: it advances i with sk_msg_iter_var_next() and only then tests
> i != sg.end, so starting from sg.curr == sg.end it wraps the ring.

I don't think this addresses the root cause. The copy path in
tls_sw_sendmsg_locked() starts writing at whatever cursor the last
producer left behind, and this is the second time the splice line has
been fixed because of that: c5a595000e26 made it move sg.curr because
the copy was writing into the spliced page, and that change is what
introduced this bug.

This patch does close the splice route on mainline but doesn't touch
multiple producers that leave the scatterlist cursor in a bad state
for the next copy:

- tls_sw_do_sendpage() on 6.1, 5.15 and 5.10, where this patch does
  not apply. The bug is reachable there too, as a race rather than
  deterministically (won within a second in my tests).
- the record split in tls_push_record() on 7.1 and older.

The copy path always appends after the data already in the record, so
it can set the cursor itself, in tls_clone_plaintext_msg(), before
cloning: on the last element with copybreak at its length, or at
sg.start when the record is empty, as sk_msg_reset_curr() does. That
holds whether the clone grows the last element or adds a new one,
covers every producer, would have made c5a595000e26 unnecessary, and
applies unchanged to every stable branch.

I'll send it as a separate patch that tags d829e9c4112b which caused the
symptom that c5a595000e26 fixed but introduced this bug.

Best,
Agustin
