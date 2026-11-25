Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629627;
	b=vNQD+gs+0lzbHMHbgenUm/wiZWf/Y/FYXQXzNknXMloWsqT9RKlw4LHKXCYE4C+u0Phh
	 hKQA4Rt971R4slMqLPq8ZaGsHc0aeb23O/Bo8SfyGFdv7iHBjm+w95eXFz4AjXa9q4PnZ
	 ZoS4IIeCcMoLNF3+cLzLzEvk+2UniKGtnOpssYLL2mAPSzS4zwKlIpN5zo36JptLJA1jJ
	 bal7+8sEa+2vbicVoIel6KatOgx7XKK4YT59yJGGfUNf79QNMO12KxDCtZ/1EJHLRVb8p
	 3fTOlNymBkTZvKmz32qfhwVWePSbRlQIOWtLTkckVgMegDpqrZdZdHxSOgXeXD3WeZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=xtCkJCoLS/gVcb2dtPhhAeiTjxZ1B1vQ3swxij7EqrU=;
	b=hE59yBptlLZxKRF79dY5KLOfAI0p4240HeEUKuVjXhRI0frN5jCpfcTc2TzoWwMIztU5
	 aawt+7+NJjd7Hnuaeo8ltL9f9tS8Gfmf/WmGSCT2+JNhzVN4RcCcwA7KJhGlNqbT9i5F1
	 yqxJ2N5DuAr6+opR8ALNek7HFk0LoUAANEZXKTn5L842gkA5NtwNj6Vp+u/gShhJ3iP+c
	 Nq/8r1zaiYrDu/hnsn6Szl+BqsWvAmNyy9G3StWcgjOq28VfC3fuz2PQwHZvdfheubmur
	 JuiLkZJGNE/QxFwO6lVD7Nx46Q1moT77gD8d2OBGjcDr0ohPq/8IGiBvncv5d/lYxxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QwcH6veo;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7C9606A32D
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE7C9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QwcH6veo
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso3077970a91.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795629626; x=1796234426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtCkJCoLS/gVcb2dtPhhAeiTjxZ1B1vQ3swxij7EqrU=;
        b=QwcH6veoRwsoOjbdzXbJSS5dTRE1R7tkJJlsT5irxwjA5e3Uuq8ypVCxOiP66iZogC
         eTZJY4GsG3iTjZIUFLTisu2Jjtnq3ftGr6EzFDhmbELJcW2Q9ePfNpc5EEXBodVODt1t
         cTUEK4YJb+/+J2FfXZPKMIVF1GttGu3RsWo0FZrf7uibEWgx/YM3Ux4qOnySoZJcAjl4
         AqMxZqS7JrhTfM4YWPauUNSpp5NoMCwM56vWw1aNYkA3svD11BGtBF+vJaeY3FRKDdxW
         wL9UQHsv/j6YmRoLEl6o0SeyibGIjWPrXChxn6tXzeFWgofrfRKYx6JExGTbGhhmbwJH
         yubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629626; x=1796234426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtCkJCoLS/gVcb2dtPhhAeiTjxZ1B1vQ3swxij7EqrU=;
        b=aBWTh+FFosUeSkBX/hfeSUi0dKmLdmmb6J0f2zP7nJyWWX6iuhkW1pw+dtBecjMQcx
         GltUXgSCycD/PZg2bHNJvnkbgVYfTSgJzR7+bv2hOra6PvhyPM5XZU38MvH5tHjix4c+
         dM9a7hrxZs+DIMH8/o4BhprOpSAO4GwGG1GOHaddjknUVFRELBTyICPRAromic6yPwRz
         Yhqa0h+2A0DeUYqIGRVE0i9okn3bW1HWVjkenMv50sV4N1mqS/D3OtgShXt3JzR/Jnhm
         5HInWdQkn/eQm+ahP6ao2mlf8YU6tVHiwtKnc/aj5zEsbMWQhPCmqdggjxIYncm3TfIg
         HDtg==
X-Gm-Message-State: APuU4Z8vVPoJ8SK1LnqQL5No++wqYZMPcB7q5PUZCEoWqwWDW6rdmMuK
	u44Z+1fe1OPao3L/FXURcVU7kIOHCGQxCJJTyyf4RxMV5Plew83m1zhfaIxxp8CgL8WGfAn4Zs1
	rsnfY
X-Gm-Gg: AZFdTZd30L/zjNVbVe90z6pSJCJHjrtvDNz9IKLJa6TmunhIf8Yx9PJ+XaLUIisM6ZX
	J9WhXMqfHPj7IbwuUpND+S2ajZqcjfm3XamYRt8jMvPR74KL1u81Zg0rlgysBMmN3QO08qeQ+Na
	+16+uX6aNXZ9zpbNYLPnSlRpgXrYP+F7CvFAEOdkYqzTmKfMZzulcZMFYJkoKyyjXDrc+MI1H1J
	c6i9F64t8p5p0Kt/Rb6Rd354NHJpk/88Iii+LMRIgDQ5VXL/q2tekkW8pbmndKxRMME9t9a0GwM
	myEL2pbF0KMhh5kGcoI6hxDdg9mi+b7AyuP1RzJnTX8naAQUB8iyd5X0wGDRFIfzmx1E5DslSwY
	XX5NooVLUkfQCj9Qo+4noZccv+K7tRaCw6nijvynziGQ9B2dLyXjrimVtgqJatv/FExGMZ7T1HU
	3sexFG1pUMcNyjAxiTakKc6fplLP9ZzGyAyl16SCF6X51inff1vlEn/F5zDFMp6xiIXD99cWMye
	lmBgI1qFbC8B5CsjBH11YoqQarGQzvt5j0AKfCCYml+yxfnkryAFjfpoz4DX7qu7Y4RKBtr7dAp
	ygl5MoHiopf0oLpWnnG6zdNTl9YOGhD4wWFdSzVXV4M=
X-Received: by 2002:a17:90b:3b52:b0:3b4:15e3:3a4e with SMTP id 98e67ed59e1d1-3b41c92c96cmr19138756a91.41.1795629625782;
        Wed, 25 Nov 2026 10:00:25 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4c::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm29559107a91.12.2026.11.25.10.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:00:25 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com,
	mbloch@nvidia.com,
	Joe Damato <joe@dama.to>
Subject: [PATCH net-next v3 0/5] net/mlx4: TX helpers and deferred doorbell fix
Date: Wed, 25 Nov 2026 10:00:13 -0800
Message-ID: <20261125180021.1804204-1-joe@dama.to>
X-Mailer: git-send-email 2.53.1
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

Greetings:

I am working on adding support for SW USO to mlx4 and the branch I have with
those changes locally is becoming a bit long, so I thought I'd try to break it
up to make it easier to review and merge by first sending this prep series.

FWIW: I plan to include more detailed data in my SW USO series, but I'm
working on SW USO because it significantly improves performance on hosts with
an IOMMU and an mlx4 NIC. I have a lot of hosts like that in production that
would benefit.

Anyway, back to this series.

Patches 1-3 factor common code out into helpers which currently have only 1
call site each, but I will be calling these helpers in the SW USO code I plan
to submit next.

Patch 4 and 5 add code to track when a doorbell is deferred so that it can
be written in the drop path. This is technically a bug fix (and I need this
to avoid the same type of bug in SW USO), but since I have never seen this bug
occur in reality I am sending to net-next.

Thanks,
Joe

v3:
  - Patch 4:
    - Set doorbell_pending once in mlx4_en_xmit from !send_doorbell so
      XDP_TX doesn't write it (Mark).
    - Dropped Daniel's Reviewed-by because it felt like a significant
      change from what Daniel reviewed.
  - Patch 5:
    - Add mlx4_en_flush_pending_doorbell, which clears the flag and call it
      now that mlx4_en_xmit_doorbell doesn't (Mark).
    - Dropped Daniel's Reviewed-by because it felt like a significant
      change from what Daniel reviewed.

v2: https://lore.kernel.org/netdev/20261117155353.2250540-1-joe@dama.to/
  - Better cover letter subject line :)
  - Added Daniel's Reviewed-by to all patches, including patch 4 which has a
    minor change (hope that is OK, Daniel).
  - Patch 4:
    - Change the struct placement to address Sashiko's review. The new flag
      is moved to the area of the struct marked as "cache line used and
      dirtied in mlx4_en_xmit" and tx_dropped is moved down with the fields
      not used in the fast path since it is only written on drop and read
      for stats.
    - Update the commit message to explain this.

v1: https://lore.kernel.org/netdev/20261110231304.1859217-1-joe@dama.to/

Joe Damato (5):
  net/mlx4: factor VLAN parsing into mlx4_en_prep_vlan()
  net/mlx4: factor csum flags into mlx4_en_csum_flags()
  net/mlx4: factor HW loopback DMAC into mlx4_en_set_loopback_dmac()
  net/mlx4: track whether a TX doorbell is pending
  net/mlx4: flush pending doorbell when dropping a TX skb

 drivers/net/ethernet/mellanox/mlx4/en_tx.c   | 95 ++++++++++++++------
 drivers/net/ethernet/mellanox/mlx4/mlx4_en.h |  3 +-
 2 files changed, 68 insertions(+), 30 deletions(-)


base-commit: e20f88c4f08bc9dba09c48ddc9806015f79fb20b
-- 
2.53.1-Meta

