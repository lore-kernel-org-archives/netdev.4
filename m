Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449173;
	b=lAsrnbIpnA6Uwx3qhDvFiqiN1Jvdu8CbgflY1X27QykCku+G4GwHiEofcb7BNg+1YN3E
	 483T9/QWt9RHb5O746U1CFxqsfnkw0OzaAx2zX3bf7duEPupf934vQuXkh3M8wHq9DNBv
	 gdE7beDEsxr/bECkdMNv/oVtPiIsi6M272MTAIVx+ogfPyR32VvJ7Rtr88LJk4g7pEY48
	 ycxK+RUcF2PQnJS2Q0z0AwIcg9EvEm6n2YLxN9qLo0AZftJK3W/JSy23qx0HmujMSAKZs
	 keGl3M/xGp8+G07pyX4RHKBGbheVpgX9WYq0COZHPTcVXRFxqxDS6VAy8oky5ZGjq/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=guIdQE/iqDvGoyLfjM4Tr3vD0fnxKmiMHHuG0kl8J/c=;
	b=0nEcTYQMq+ZVfaH7EV5N00UoV8VpaJUi/1cReJNIbUWGAjEOYHjMWSNj0jCKFmvmYccX
	 ubVTryvEwqpGxcq/1h9Z4yEDcz1x4bp3Q23ia3gYApnoiqKOwU6xmYi8Le9jJq02K1Auy
	 yJVtJU6OgbGZPOACKRwfTUtEWtZFSKqAW1CRCLOxB7f0kFC14b1ZWncl/UN4MlXecNjwv
	 ZXXo5h5nQUUAOagrw28BvWwjVqebWoQcDippin8Zefp7WtpvoBo+pG+w7coeiRKNyzSHv
	 LnI/Qa8zYNAuYi5ag/ETMuT6ipZRFiqB3N6L/R0hTlVZrsaycUMagiogIwcVV0L6BTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LOP7+Gnq;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D46F606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D46F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LOP7+Gnq
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so2520020a91.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449172; x=1796053972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=guIdQE/iqDvGoyLfjM4Tr3vD0fnxKmiMHHuG0kl8J/c=;
        b=LOP7+Gnqt6kSwTzsIN005aK/objY89TCZs/rRJHOb26cCZXu6c4Li0tMy/tbzdnF2R
         NnYX9jVQcVPf9FgzEL6Q7yIFoFnum741vL9tAcAVsrEsTiom0OHiuAH5BVtynIeKTLg7
         vSBqKgbqTBENtUXGZZ5NXAjkqXq7QqM8ZMBqyT1Zjf9PGgkFj/42ewbfpQa56kNDBAls
         4DKEecZVq55oIEOUO9/pb9nJjZ1xmOzU4xwU61itjJOuQK3jkGsgEX2ABFeOp4oFXK2Z
         CFagj0MXbRjLBG4NmdbyU6zvJCL5MP49BKIQJLu3lHCb6Box0iEYTcSJG0rA2yp0j3Hj
         N6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449172; x=1796053972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guIdQE/iqDvGoyLfjM4Tr3vD0fnxKmiMHHuG0kl8J/c=;
        b=JvhbLpOAnQbZHOFWLAIsumQDWYWHP7+ImMAKTXXO3DuNBOqC7f5kSt4siTIQCMBZoH
         /qG9MPkO/4hq6a2BM1HGW61EzWKj540bfVfnjOmDOmqeHFKtnfEDhayLWyo83gi+qL03
         xHX/d8kvqPgNI1dEXmfXb9EB2t3y430O4JjWuDS7ZugP0sld5D65HD/EZZspAFZoTfJ3
         W9KM9/mFbqFQGv2ywQf/q7on/cdCOOJoN64luJEd1miyyY3Dpr2SdIpXmZhrfirU5+Qo
         ZxUohEn2ElrdY+5mJjeMIJckKLeUd5+Rl2bvSg+avU2kfDQKNB+PVvtbd9QQD5zU5DXc
         kdxw==
X-Forwarded-Encrypted: i=1; AL+hErEcGYDbJ97ILV2JqNblEf40OhS+hB0i6Yfr0OpEt++Tg/FFLgWqxn/wxCvWzcRbiy4DeUHYMiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i9unogvsNSc4eTZOtlIhzKyN8kX1cPiKvbc8LTEdlsaE3/+pI
	j4ieO4j55EPej5m/1Pu+1TS8nZSA9hW0yKpb+MNGiV3jOvqRC6coWaB0
X-Gm-Gg: AZFdTZdD+qfEyZv52XXRcjOJcUq4nNUiQ4Q7LuNiRLreDJC6kGsq7xyaX1QnBvcRu5a
	TMVanKblzd+Gz2dUy0Ubs3gnTpymCILVTVaQ/Ji0chMtKRwAsAyBHdDCYZ+7NmFTQBpAnKXYY+C
	JntMaYIyFwPT+4Djw9bgw3zCkpIduKr9Z64SMRrpxx72w1oTCs/c98Juce4hYEKzWPBv4lQAozG
	e6dkwOvyTXehWGOvDosM+/LrEeNKg0NMffzb+31v4fg1yEUG4syhnPLAtoPSUNdxYs+BWEzKj0k
	qiIItcf2XmPFq6ANpqSJQr6bpcHqKH1WV4c5FeR9Ta2f0GE6dGyABvliA2DvfDgNFc/3n8UzEMu
	F3lffwIMXxP+shFNZa7HnetqBNg6TlWxR1fUzxNykjlNfrOWGtYQuTEhqWWJgEfHQ0E/6M9VHAE
	mF6h5FsEWFuHNm7Z2x9E4yzBKQot1qpp3v/Fwsqct6QGM2rPmyiIjfmrV1jJ3bZZX5qcTP/v4pd
	sEmHZ8741FMpQks5fad0h2q/frC/36BWyafANZZlfA3ak5NXyUFenekGZ2utx1K+tGeoBgEsujt
	itIENFnN5+GZDK4Gxo9ahk5H08S/g8VwnH1YAb23nOQ=
X-Received: by 2002:a17:90b:4d10:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3b41c8d9bedmr10884695a91.23.1795449171734;
        Mon, 23 Nov 2026 07:52:51 -0800 (PST)
Received: from LAPTOP-G6J9COQB.lan ([113.11.180.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm21596601a91.12.2026.11.23.07.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:52:51 -0800 (PST)
From: Ahmad Wicaksono <supersonix03@gmail.com>
To: bpf@vger.kernel.org
Cc: jakub@cloudflare.com,
	mhal@rbox.co,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	Ahmad Wicaksono <supersonix03@gmail.com>
Subject: [PATCH bpf-next v2 0/2] Documentation/bpf: Fix stale references in map docs
Date: Mon, 23 Nov 2026 22:51:58 +0700
Message-ID: <20261123155200.16676-1-supersonix03@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Two documentation fixes for the BPF map pages.

Patch 1 records which program types may still mutate a sockmap or
sockhash: tracing programs attached to the sockmap iterator, sock_ops
(delete only), sk_reuseport and sk_lookup. Anything else is rejected
with "cannot update sockmap in this context". The kernel-side sections
of map_sockmap.rst did not mention this. It also drops the reference to
progs/test_sockmap_update.c, removed by
commit 5de7a6eaed89 ("selftests/bpf: Drop
tc/xdp/flow_dissector/socket_filter sockmap mutation tests").

Patch 2 fixes two moved selftests paths: test_lpm_map.c, now
map_tests/lpm_trie_map_basic_ops.c, and test_xdp_noinline.c, now under
progs/.

Documentation only; no functional change.

Changes in v2:
- Patch 1: narrow the note to the sockmap iterator, after
  commit 18f6c47d1097 ("bpf, sockmap: Restrict iter-context sockmap
  updates to iter/sockmap") (Alexei)
- Rebased onto bpf-next, which now has the bpf tree merged in
- Kept Jakub's Reviewed-by tags, as Alexei asked
- Link to v1: https://lore.kernel.org/bpf/20261114170117.196552-1-supersonix03@gmail.com/

Ahmad Wicaksono (2):
  Documentation/bpf: Update sockmap docs for mutation restrictions
  Documentation/bpf: Fix stale selftests file references

 Documentation/bpf/btf.rst          |  2 +-
 Documentation/bpf/map_lpm_trie.rst |  6 +++---
 Documentation/bpf/map_sockmap.rst  | 18 ++++++++++++++++--
 3 files changed, 20 insertions(+), 6 deletions(-)

checkpatch.pl --strict is clean. make SPHINXDIRS=bpf htmldocs gives
identical warnings before and after. Documentation only, so nothing to
run-test.

base-commit: 2bf3351c5f894697e8443eeef5333d4c4ce90cab
-- 
2.43.0

