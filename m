Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930842;
	b=Bxly3/SmNndhRZ2drvo9KKWwYLHLbr5MfO++q9FLpYP1NZd7Hb0fOj6yW2BZggw3BzdQ
	 UFDI78xJKehvVoVb2lYtIOdvsOqImGfL8WDARq3THGDlf6OCIMDnH7p/twM7/gl1C7UvD
	 AEBeIkRdGujAteh+BNJSkceCevom2ewmeoLGiqPLOL1hC+yLs/9yWAyQgotXN23phIbyC
	 A+w5Q/j4XF43fSntZktfii8ngYT29z/XCsSfoFVFu/pHHDuEvoFrOhz8aMqy4HuCBMDjJ
	 GpC0z0uf6P0+yyCGlQPPqpiHBr/acre/VaTzKoYGA6udn/rxEy4s+VYBRtwr6xiNxRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=J2IjfEFPn1TkX0JoYvkz939IJBltfJgLdRqFoj7aTGQ=;
	b=5QK/xxze7PM7pfyL7JpyjkNxvPjJrbp1GJUnvOM1kxbmzTHqxVzaCQOVaKP7y8hV9qjj
	 ssNovQVPc0YnT7W0KdT+z9MO90TJj12rIyoqguisWk8Cw4vHgCmnV2wM60zpM+u8V3gWl
	 tzwgd6CccvlI25Gok8R2MOeOHUt05PPGFSgxm4eHE7PavOSbQ1dL7wK1P8AA0otMHkyyG
	 12oswpv59khIkElagHtGGU2teKH/cIIcgI1r9KtZNf9oB3+KqBgQwofGLFoh9Di0eEsZn
	 zhXu8/LeeI8neG/UOnYDKbjz0X8pp60B1pZlOmkL8gacNnXF3jWhRGlhr4QSCyv/n0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="r0o/7UgT";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DA4606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2DA4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=r0o/7UgT
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso946438a91.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 07:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794930841; x=1795535641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J2IjfEFPn1TkX0JoYvkz939IJBltfJgLdRqFoj7aTGQ=;
        b=r0o/7UgTBhDVgIsXKmi3yThIJQ4HLjTGTAZHpI2yBgSCZKSe0IS0aLYLFDfjg6jbdx
         PiTi4ETstssmo2Qe74jeOng1bOPhMoL7vHVL3FzDNsvy7btPyL2YOMV8O9Fe553pgql7
         QpAbdV4A8Q2N2D5dIurZ8nf8/PV7lX6FlC7dScU+XD2gP/MgMRcYaLNPyhoq/iF9sp5Y
         WqYjAMg/WXTCZU1ts+FCUkLs5dtqGImtEekwK15n9Q9S5g+5PDAX9Rk4OW3+MjlENqfr
         BxQgRVZFjphB0NQTJOlIcwDRCs/KYWvN3tPE7EOPXeK2MiQn6Mpke7oTUA6IJ9DbW8wE
         syaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930841; x=1795535641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J2IjfEFPn1TkX0JoYvkz939IJBltfJgLdRqFoj7aTGQ=;
        b=qOEIflpRlCz0cXuffpyOFJdqdaL154FGASaLJFVFqlW7W4/IVjEP6maKeivobmpxPV
         x6cuwSqsbz8h28U6tZTy6/GtegY6OzmdZK+5UmtmymD9FNFaMEfoKI8woUk3f3bmwsAb
         Z6uv69h1FhRFQlgF9ma4buRhMb08rgVbnKr9zXNIyFFgaTlyUi74R9PSYngB3IKfe11Z
         8/g+NSBBRP7sVBYOPxoJ2HZ97N1mRkLjPZw4LAoer4J6wYlyi35FaCraDqvxLy1PMVFU
         KHz02H6IS+DD9/FcxWZIhcsUzWH37uTbkiD/uR2AjS+wQOvVuaFVrmFnGyKNNy0bXpX8
         Fh+w==
X-Gm-Message-State: APuU4Z9izCk7VLjzkTJpQu69etCXckau7I91jZ+3KnDQ4rxLl/CMvUdt
	GjQhSWKi+AK5DNexAZd37GLR5bn0LxspWCtbpP/tJzPlLivWrdug6gS0oyWHcR+vKP337szSG8c
	XpyiB
X-Gm-Gg: AZFdTZdTeFugcDoIkX7X6yQUrrtLlP7J5ko9gJqsR6S8ZsjPCHdzRraeqTf2zx18rjv
	Hh+cVyctL6HGu3d81/6xT+kXF6Aej7ewYrzm/xkdliRVe7Bmd1lD66jWpkUCtALFJb+YlKYPyXV
	e8skJDuE1Lodm8JhDVe/uoW+e36ZMqb5v2+88dxqFUXLpy4YF7f7JklKfxLwTvW/yML+alb1C+a
	QJE85DgFGK0q91QpFziil5QqP24NhmlxVTAIXSDfudhNreUy/7aHlHMFgKnHPtUCj3ssyQ932/E
	2GEMA1xpY+xfYJVyWlh1TMWAVnoqzSm4vpFYMj7ibNcruOirHhLMhSSe4iy8VL9mHnJh6FPOZop
	0HAfe3J3Bgt5AfOHqINNgU6MUxURV/Rnk2taYZG1koolJmil6K2D0jBRa1jDbT2BbSIjn8aFUvN
	6TWZkAlac3Bei5sruwhkQjp9RIg+UD0x5g5lCrJU20mQ57dl9tILaPr33iRSD+01oe7xoHnLcyH
	rFUtO1JWpz/lb5gND87ZL0nVVsJz/zIgVpyEwxl1iZwdDBkL6H3NNgqsOUvuB9+Z7ht8OKtPBUt
	/U6mm5lu7Bi62bUk1KHTDcWp/8PELFbKOjqY7EpdgEc+glNSnzCkuRI8WGnty27eQQ==
X-Received: by 2002:a17:90b:4c0f:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b1b0b63d19mr13616982a91.47.1794930840793;
        Tue, 17 Nov 2026 07:54:00 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:5f::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac70ea45sm4543993a91.17.2026.11.17.07.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:53:59 -0800 (PST)
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
	Joe Damato <joe@dama.to>
Subject: [PATCH net-next v2 0/5] net/mlx4: TX helpers and deferred doorbell fix
Date: Tue, 17 Nov 2026 07:53:45 -0800
Message-ID: <20261117155353.2250540-1-joe@dama.to>
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

v2:
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

 drivers/net/ethernet/mellanox/mlx4/en_tx.c   | 95 +++++++++++++-------
 drivers/net/ethernet/mellanox/mlx4/mlx4_en.h |  3 +-
 2 files changed, 66 insertions(+), 32 deletions(-)


base-commit: 6bc9aed3994cb04708fef02dd6d2f1cc5c5e8229
-- 
2.53.1-Meta

