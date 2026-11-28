Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848012;
	b=oQ5aKYCBMaXqJX3+9JTxm15pKRiFC/smbtW/0IRSy9q7uWTmIrw+u5MdNqDEBNWcb+DH
	 cI5tKYuWHMPY14Yfhakk5tL2nHCSSbEJqmhPoXj7OIj+w2RN2u06f78/iKOI24km3Dt6b
	 UC/7CXzlvCsXYzMWe+FyFUM8DFWLB3FuCTXPDSdm9lI5qK8WTxDfKv4PWKrxozp0pHBb3
	 y3/Unw4+K2o5lttGJuTIbVH/3XSYsLnve+bPVwhdpKWttXw1865/Xc3EjzOCcJL8qXZEv
	 q8S1AbvjUlO/3pizq9gKug+KDdjt+x/9xkgJK8N7qh7Dnu38QzGzRLVqexYmD4VRo4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=atDHbUaPpolVNmhfJMz1V3USzM919RSK/gjCD65pZAY=;
	b=RqquWSoUhSqDmDuU33E9Dg/Ax8PXSMXTmk7sqFDQxgt99ifLKtzTwqUTCi5W9rggOpOu
	 pmEe8DDjyQut2CVyoQjk76GOYjh1hIvpA+7dOCfqnCDjn0LeNuwlQPGYwqvNuV7F6T6Kx
	 X15Qpe72OB7f5ciydDf+42W4F+rU5TA2aclE1NjTHm1JjyUJHyJogVPLiWksvOyu16PDK
	 Vf2T1LRs2xg+djVEIQZJGCSDuDdd1FDDEjFekO5I03+v35B+Yc8ihaFGr+P0mUBIgKYZs
	 M1zG5FcskervgMoBC7dcH8ZJ3YDOZ/EIasX/UTwrJOiSPlru9uMYLCURizlVUCaACxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KMIclyEW;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58A4606A31E
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 06:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A58A4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KMIclyEW
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2af4c8d00so10330212c88.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 22:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795848011; x=1796452811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=atDHbUaPpolVNmhfJMz1V3USzM919RSK/gjCD65pZAY=;
        b=KMIclyEWk6d4ssGT3dXUKaQfWSdOaZtqT9NZPWaeHrIwPePa7plNXvWrIGDM+81tEf
         0DktdZMUSXLgtdUN4QtQaZy7jCmnFR1IyOobfyJnjmhaueSrDoQtIL2uOdmf9KaaLsbu
         R/29V+Z8ejmIHqSTimT+BDZ7CLxgVFo9rgRPH/LorQ41DosNaco0tx8Wb5ota8yuMQGs
         617oByciFkuUf0LTV8/K+4F3uVlfySBnuZXXjSgALAMmIVcoyVgjKSx6mmqs27KpXOcB
         piEyynBNqiKKBDvrjE5Ndwp+nArulAbFamIktI6N4q6JacdaMAv00OFnWunfaD0ontKD
         jqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795848011; x=1796452811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=atDHbUaPpolVNmhfJMz1V3USzM919RSK/gjCD65pZAY=;
        b=2IZhK80JOyBnhZ/t9kyj0NH2DLqnlNL490FGSIdHk3+7J2ndHsjjrhsPjIpYeACLkb
         hxAcHRqvMyKSBEbwAekOXbBGILk2twrXLc0yoZEBrpbm6QYY0Q8rD4ESqBhn0hBD1bxa
         xZaRffJ3JW36CelLgoIE0gFMhmMpS5Q/ZpdF16YvkRdO/7BGMBkaNYljgzMpLKzmRq/4
         6uTuvgina8MTkxsFB/QPLy1HmCvCqcyLuTjOlcTJYNDof8DVv56KQOHvJoRCS5hHfXl3
         mADdVt1S2ShLHGxGRtOoyHYeJuRpmR/Q2e2oXcrIHQWLEWTmiCZmrQ71rjQ1+fDVmEoh
         7Lsw==
X-Gm-Message-State: APuU4Z8Y/sd3G6qq385JFPdVUQaZK8eekurIKWfBRd8u5IWGiG658fy8
	/Q2gybTbfqbWf7/GV/qTlrystmzlMTJy1gt+dqvHF6IU0MRjAHX7/3Bw+CKdgQ==
X-Gm-Gg: AZFdTZfBgRMX1w32nSfaA95YRTf4B5+Fm8g9AlpztouY+bahaCYxUBxV/MaasRxmPNQ
	hvQmCO333LsSUtYUJlp7Uho9HfQsFCUX6dxulb3xlMzW/l3YCT0BYSoahu993kF0Tjk2DWkYYsj
	py4oMh6DRuA9JyZ4ViTsQK+RB+UwrUW0WgdmItwaCrvebLeO4Eb7KtbuC8enzwr2jkGVaeknQ8P
	lvPI4KjmCA0I4ifaifOv2669Euf3x1EBRR423qprN+ZTdm5llc5Vy6WVgodoxEyeAc41BYgbnzv
	kVvgtlgh7YtSAjnDBMWKByjY5gThV6bg2eywquoTlMmeE54cghtzmZN6WXXf13AeWMNWg53r8JI
	+0UybwP7SraxxSbUjGNn8FUf0xAEWcdHDZS93wkVf2N5ZGV/9d0AL5p4KzMIOEdV4orrWcErgcs
	hidTcwilKNXo+5283LCvHjYcGrwNX3Ge7C9zmsOeL3/Ztpqc327FkXnCE8m/o9SDxV3eu1I2GMH
	bNoUOqTGetBeXrRgFLxB//RElfUjBdbhCh+5Z/8uWZmSwC5az+1RWf5y4yOBQnpFRZh0NoTWNHN
	ff/udfNIt80fZgJdEWdLSd7CQysc8/lCZoNgfwtrZHtQCgDlzv2WtjFkQ78EyJEiIfQRnFJhfaG
	EQLWqYX4nqms2qrrQomsf9KOYubOCr0/XpZAZqxk8jxyTwCyIGJzKXt1P6T4xMztNfVE=
X-Received: by 2002:a05:701a:ccce:20b0:1b5:9075:2334 with SMTP id a92af1059eb24-1b590752388mr7460055c88.12.1795848010582;
        Fri, 27 Nov 2026 22:40:10 -0800 (PST)
Received: from l ([2603:8002:ea00:6800:c936:de14:80b6:30c0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm60446286c88.2.2026.11.27.22.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:40:10 -0800 (PST)
From: Dave Seddon <dave.seddon.ca@gmail.com>
To: netdev@vger.kernel.org
Cc: Dave Seddon <dave.seddon.ca@gmail.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	David Ahern <dsahern@kernel.org>
Subject: [PATCH iproute2 v2 0/2] ip xfrm: deleteall mark payload, and drop the cast
Date: Fri, 27 Nov 2026 22:40:06 -0800
Message-ID: <20261128064008.2028008-1-dave.seddon.ca@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Stephen asked why RTA_DATA() is cast to (void *) in the deleteall mark
fix. The cast predates the fix and is not needed, so patch 1 is the fix
as posted and patch 2 removes the two casts.

v2: add patch 2; drop the Assisted-by tag.

Dave Seddon (2):
  ip xfrm: copy only the mark payload in deleteall
  ip xfrm: drop the cast of RTA_DATA() in deleteall

 ip/xfrm_policy.c | 2 +-
 ip/xfrm_state.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: 35033e4713fef87ac204fe0fe574045563d1475d
-- 
2.56.0

