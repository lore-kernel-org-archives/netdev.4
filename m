Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795738609;
	b=pGSbyv0PUMLDPG53O2D+ww4wGq9x37lox1IUYa9SWoD5iC+EnKQxgx7/m+2bOWpQSUwK
	 NoVJRE/dQqNRNUO9fpgYgAdvL8xFseut7Zm3fWhv7byatsZuYV9zzYkojJ1HEBlm+KukE
	 1QPnP3kWj1vCH73cYZtB+PvB+QV8Cg/jogz/4JnjMNx3drax9tGOZxShWdHCW7CAgmJjV
	 hCEbVlgMt6jeE5vIcXsScFSSxoUA9ikt/vQ5iFE0FwJdi3k7U5IYu7DDECM7shZrdHD76
	 5GoyGJOFDU3LnyljucBGFAgQOc5U8ndI4YkFxQ6JRbOyX1mK6UqH52tIW4oKZ/fgHyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795738609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DaucjX7EGKxhjPytfA6PE6Q1xmcvizrq4bihC56pvSM=;
	b=ivOXMOd02twXQxvwngJmE/bArrdXt022rgL5nd1K0ybhjjGCX0oXY6k0LJsEQnvwkFEo
	 2EhyCIW86d6bCUUaJgzQ9xcyBCY9wkoGdftkS/SHhtDFkvXenTd8A1of61iTPXBg8H4Hw
	 VLVZZWZAx5QL0o69dbRZn4NeVBM2J7Ji68td2Z8A0NbBpww9pzKhlnqVkhIR2fmusTKBN
	 Rp6no+k6mnjDosMWRhCvUFxeCYKiUT8GYBsl3oFvjigsmlE3LMbsIt9gE62R43VtUxsxW
	 +zXEIE/23XBctJy4au1DVgnQmzQxVuZLN0PLbUYRsbHq4ZXNkKz7MKooiIYYuj4548Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lwLIWbsQ;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D9606A323
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 00:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D3D9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lwLIWbsQ
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so46687795e9.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795738607; x=1796343407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DaucjX7EGKxhjPytfA6PE6Q1xmcvizrq4bihC56pvSM=;
        b=lwLIWbsQhHcHN3CDna52sVsq9gSO9DJklq6bzGLe3Els2E42gC4pjSTwi8CBXWLj69
         Y6xmDtc6vsito++1VpPJRTsurb0wgyvDhyMIg+LD/l26p52SEGOkBsnM4H/sadwjMOqP
         yqZVtUrGQauUYqpHZDGlRuUHH2sCLzuOyxWAaDjFw2nfdIdTw3taHA64sqf7Z8bP4d13
         8Z/U3f1HmgsK3yj/WRRhDbndUus2MBgUPvB2KPMI6ZVKHsF+COYApylXIc+drZgLM/Bk
         Ed4rW/K8emw3n7dCq2ap1AUGQmklHOyJbD33q+73qeC/NDNq5fnm2CwdYHjz+hEdCPim
         22Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795738607; x=1796343407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DaucjX7EGKxhjPytfA6PE6Q1xmcvizrq4bihC56pvSM=;
        b=lnH2Moe+uJIm9Hgmpa/9OHdXAc1yOlBoOqBvtqQtGz5QJWy9YA9MOHDu8sMTKsRnPH
         fhbmZUAEjtJ2RPZhc5NSxZngcoq6vtzkRT7ao8Xuh2IozSKnfPxuZSazJH67teVsA9hP
         n10fxq9IUkpl+Km5b2GxezDi5+f0D6PTRI3cQlhqOjwagwVtYYJ8U6dF1vFo8UQeiOMy
         p+UlO61WzOQ9MJadVEhJRVfbTONzaOsZscRaK3/RHO8NJQpH2IQ0JhSgdm4FkF3S6hof
         LvoLEcBGjBv2SZIS7mQIWxylke9CePA2ZGlMFqc/NHWkN1Mu/GV4uqJCN/po78ueXBKQ
         G0Cg==
X-Forwarded-Encrypted: i=1; AL+hErFWXx7It24ntCe+0YIIW4Yy91aV0RkpgeKfI3OyYii4fDdotjmC2jPKukEvCP7Qz0ThUEAxJX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zY4lIRmfA0YUIv/lUtI2j7ExmVwkMD1nfTbvXTBV2tfmAgB9w
	cpuOJZMD84wWldtvTV6r1+sYJQ8Gxy0CKgTDjoGYM62LzFB5wQHv+6g=
X-Gm-Gg: AZFdTZdV8Pj0HqAg65HmfVKSK3phLcoyFw8DNdbojANnTW86noA1rQ7OYLf3PiZ1Q8H
	22XUWe2wxDcA1pFkxjryyjH18/RMjZhMltyyIgdaGNcYxOhib21tpjzdIfxlWEl+fc7UJjPN8R0
	FYxCfCVJRKFsMT/OACTXMvgs9etwxu0m3CfSgOe3gc4iaEtmyaAgWkXBst3COTBI8TESsKuayxQ
	1jXHFIB8+qIqDDQs09lWqcmIYGBL0N08u6S1BRIzV7o7heOlulwy7cr9C0FRHOHPS0AdltfRAFM
	rztoGavQGs4c+ZFrxqJi8SAqmboQsfl1CFUrxCwJpU4uf5ZokcFGP8HeZ9d3D7YQJMzT/ld5NMr
	RIYqnHohxw4seN+uH5KUTS3rwwofCbAxD/9xQDZ+WBdJX8iUWEmweUSU4rDkl8F2hxazFcywmvT
	elFpaaNvV3NV35Rb+jserL/Qw+lpQ4h5xpa550W62p8GeU51mK+WkljEzufYakjxpEYZrBGJeL5
	UKapM2xj8C9pJ59B7lUlJf7xq7rwxId9la7YxIffvdOha8cv7Ng3yfiq595pxAro3so/iKkQXim
	F7RPSplDQ/uHkBs=
X-Received: by 2002:a05:600c:3f0a:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb8880cde7mr439388735e9.22.1795738606729;
        Thu, 26 Nov 2026 16:16:46 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm356650865e9.3.2026.11.26.16.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:16:46 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: Phil Sutter <phil@nwl.cc>,
	Christian Brauner <brauner@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	coreteam@netfilter.org,
	netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 nf 0/5] netfilter: pin file with get_file_active before reading f_cred
Date: Fri, 27 Nov 2026 00:16:32 +0000
Message-ID: <20261127001637.1026589-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

Five netfilter callsites read file->f_cred through the
sk->sk_socket->file chain under RCU without pinning the file reference.
Since commit 0ede61d8589c ("file: convert to SLAB_TYPESAFE_BY_RCU"),
the file slab slot can be freed and reallocated within an RCU grace
period, so these readers may observe stale credential data from a
recycled file object.

This series pins the file with get_file_active() before reading f_cred
and releases it with fput() afterwards, matching the pattern used by
the recently merged cls_flow fix (commit 59cf9e6f48e5a).

Changes in v2:
 - Switch from get_file_rcu() to get_file_active() per API change
   (get_file_rcu was removed; get_file_active is the current API)
 - Reference merged cls_flow fix (59cf9e6f48e5a) which uses the
   same pattern for the same bug class

Tristan Madani (5):
  netfilter: xt_owner: pin file with get_file_active before reading
    f_cred
  netfilter: nft_meta: pin file with get_file_active before reading
    f_cred
  netfilter: nfnetlink_log: pin file with get_file_active before reading
    f_cred
  netfilter: nfnetlink_queue: pin file with get_file_active before
    reading f_cred
  netfilter: nf_log_syslog: pin file with get_file_active before reading
    f_cred

 net/netfilter/nf_log_syslog.c   | 28 +++++++++++++-------------
 net/netfilter/nfnetlink_log.c   | 35 ++++++++++++++++-----------------
 net/netfilter/nfnetlink_queue.c | 35 ++++++++++++++++-----------------
 net/netfilter/nft_meta.c        | 16 +++++++--------
 net/netfilter/xt_owner.c        | 27 ++++++++++++++-----------
 5 files changed, 72 insertions(+), 69 deletions(-)

-- 
2.47.3

