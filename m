Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794978976;
	b=lAzqkC7qArPjvxoK99O8vB6vu+WInMV/rpilyvFivwO8QkUC7R1L5J5gN6/WKvTba0vO
	 +A+eOkqMkjuNuM1dbLhC1Skce+PCqBxWOYoNo2DsWJ+KDe9A13w/rJ5uXAAZhf8wzkzz6
	 qZrk0h0LPyJtObBpeSQss4OQ5Rk+sQaGrlCsh94oVk9bANomEmU7kgQOFQZXwKYZ8TrGG
	 G9K+Td9Wn1jzGUaMib+1H6AFtFHhdroy8F0/3viUpwWYR6BlidNkImcTvpAa5JUcQK3fc
	 +cGjtyqaY/v7Njth8etQdP3CAhMAlixoOHgrEReAKMDZXAsr5EN8aNaJesBZplkjR8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794978976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cuyjjq/ADVaIP+GusU/9yT03ulOQTHuNU1ExsSSvRD8=;
	b=RI/0LHsthwOFBNbchMaU9glQOvr4rjyf5wKkNPYTBHyeC1kY1Mztzse/MXJ8HIAEdtk3
	 SN/zmv+7QvesuK7gUs+0ZDK94UgDteqexRvNUSSMPro1GX/agqmbosfAyhEW5zh8xC7pq
	 Q1ZxIq9kaCoZPoIZc07HmS2XBJWEddNqBtSAkHH9I9N9s0dV81CCKdnalPWo/bXlUOsJE
	 1y1FD4/j+ijR635olaS654TvlJ3wtc9nIIkCQ9rSNfyKZDX2tUr/Bck1WKXV/HvQM7t6r
	 vkMGF1W0WVKm5bSxWWLHGaaA//20Y/drQG40XCbJq65sWp6z9NVvJxRKp1QFMUP6adw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="SG/8DsSq";
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E11E606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 05:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E11E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SG/8DsSq
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53664b4860bso5833121cf.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794978975; x=1795583775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cuyjjq/ADVaIP+GusU/9yT03ulOQTHuNU1ExsSSvRD8=;
        b=SG/8DsSqETvEmF4qRmOh9P28vfXZa0KtBi/jIMMS8TNPNQj44lJVLve4dEBymyATb1
         47fEzl+7XpzsTht+9AlzKOgvYzoXzNY+jlUZbFJuehjkACig3NBrQVTN7yCw9UPujWEk
         SzGdWmCDdL7w3hzmztrOU2d4A26Qhd5jfvhjDAKVW4oT9yUAKPt3L2RzgqxT+ahJ8eXU
         vDRbUU0HtFNebdeXhKvR+dTULEbsjfBiy0ANvCb4iqDJkY0qMPr2GV2+hQYnPJRl1fej
         /4v2k0eNdwdJ1zaRld8D1RBAd36g1wBmvYh/f9bqgbXHMjC4usT2T0EOERhHuUfbgfQk
         urYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794978975; x=1795583775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cuyjjq/ADVaIP+GusU/9yT03ulOQTHuNU1ExsSSvRD8=;
        b=JgrHCNb9g6TC+Nufrcu72mqK57vy4e/elbFeQnFMXr5C00yX54L6XpCy4djtuY+a4g
         w5lcyJv52RfLKs8LGb2q+fOe+xS22aI48GIoPwLhEI6jYGsuxzQ4qWVAzrWhG0Fgekn4
         SGzN+MpOTAg5L1Alzt9ucysLwpI1zenh00BKzTWkM+yITTa/l4B0pWzn8j/qf92rHVe6
         elYLWFk3862Za9+e3uzB0FUSrgbG/vYAIZ1ajJP+HozLDr1+AWtYNbGw2f1CF2kVxPMx
         DV3jcRKrUp+DjY/IFtWN3lpCTh69LplnVQ+zAzJO/69eimAcE2zE0OaFyJe2HKzpa9fU
         FIzA==
X-Forwarded-Encrypted: i=1; AL+hErG6pMp9snmNOTfdbXiTkMpOa3ka4FUkUxsXn9b+aGxn0G4Dv1Xo/IRtAyMhh0Dbrfs7xBAdCig=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VNlUibgW2aOCWn3EmAtsHUA+7nT66Fda/yQNEvOwOoaYhWPNr
	6cYP5eWvrleSkQ1R0/avZLGL+0AVD61jnnFdsF2Ohg1yDdCWVa9NeUSh
X-Gm-Gg: AYBFou2Gj60bbwAB5FOTHJDk//+YyvZjUhiNXzulbwD+krtMgxWK53yBong6Ps42q93
	P+K1PKP3e0UaP6d25t2VxZAL6qRq5NA5ZvzTh9wm9zb3saHbTJo/iKJ5EVEdJUi0ID0gy2eiYES
	Wshto8UOSbGdfULvF1PMnIMwDq3URIrqPsC1o1ZCsJcUWoiPyveTqIByBSU/YZIARDm8+a2h7Bi
	s/NJo81LsTVvXJR7ttU+mjxIpBGH1n4+DlRF2kTxFeTWS0FaBTYqE+11Hm01D8SCkG9n6BdLPnA
	v0oevIX6TJ7XaO7ao4k7wBZ0eqnFqbvzNW2TAi7/DK/TJk2FGDbYaejPhQl0jX1LJWmpXqqHCsF
	tvBrtqd/HbeQXEmxYhEzT9LgPlg5J4uAzVuNxPKQN7X4Uk3XRgAg2QmQ4cm5PPTe7g6GYGJ49ez
	4zvLQu5LaGtieXYTf9L1o7/oN45XtvW3EG8mHRXhguUM/lcN6/nCwBP+pQGfn9croqncM2bVfsG
	q8y1xA6Uo3VPvtnxLEOYFKe21lFXAXEU+VQHAFqtgMmI+SlsU82myMmelehwnVOy1UvzCSJeKDT
	4qC3yds0gzNCt+8ev+4cWy2dizUd4hptZpD2dKgb9dETZXgkt3XtqXCArN2FqDKbe2XFioDXYCG
	9
X-Received: by 2002:a05:622a:307:b0:536:64fd:7b5c with SMTP id d75a77b69052e-55d5a785e9amr25107371cf.58.1794978974791;
        Tue, 17 Nov 2026 21:16:14 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921149f4f5dsm12799576d6.2.2026.11.17.21.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:16:14 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Joshua Hay <joshua.a.hay@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH iwl-net] idpf: free the RDMA auxiliary device ID after deleting the device
Date: Wed, 18 Nov 2026 00:16:11 -0500
Message-ID: <20261118051611.3892489-1-lcy8047@gmail.com>
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

idpf_unplug_aux_dev() returns the ID to idpf_idc_ida before
auxiliary_device_delete() removes the device. If another idpf device
plugs an RDMA auxiliary device in between, it can get the same ID, and
its auxiliary_device_add() fails with -EEXIST because the old
"idpf.<vendor>.rdma.core.<id>" or "idpf.<vendor>.rdma.vdev.<id>" device
is still registered. RDMA is then not set up on that device.

Free the ID after auxiliary_device_delete(). It still has to be freed
before auxiliary_device_uninit(), whose release callback frees adev.

Fixes: 65637c3a1811 ("idpf: fix UAF in RDMA core aux dev deinitialization")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus IDPF and W=1.

 drivers/net/ethernet/intel/idpf/idpf_idc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_idc.c b/drivers/net/ethernet/intel/idpf/idpf_idc.c
index b6cd1c25ae5d..9d3c55854477 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_idc.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_idc.c
@@ -253,9 +253,8 @@ static void idpf_unplug_aux_dev(struct auxiliary_device *adev)
 	if (!adev)
 		return;
 
-	ida_free(&idpf_idc_ida, adev->id);
-
 	auxiliary_device_delete(adev);
+	ida_free(&idpf_idc_ida, adev->id);
 	auxiliary_device_uninit(adev);
 }
 

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

