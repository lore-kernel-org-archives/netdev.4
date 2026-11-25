Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590239;
	b=oA+8Ho8s8Ne8L+m+lDqZYhggOuM7VgKj1jEJ7DkMYxqx0lSe2pWBPhEWuy8/LOQDImTW
	 RMDB5WQTSbDtAsNucvOwXSBkmrztmG9s1BRPTOr2/177kAaUhfVtWBhmSNA3bA/WYXAa6
	 +dUfqNXLo4G4WvSj5G9+hUTHjvXErYAHAdq2X+IRBGa3KNd7Af1o0SpqdR9UAOtV/Tmh1
	 yKmkIPno+2w59e9FOQj8HasokSpLZP8jyMYW81iiGlfObbDdsLOtrFvb+ssjv1ELHpuBs
	 hcEr6v4+9qmwVOkS44zMlNU+ZTxy8m0WF+nCaWlUsgfOBoHEtIA4lfWt6nl5q8OvymA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oACP7KwOi4wJuUdzN0kOj5H4T/uZOHxuyB1uiYqEcAU=;
	b=lAhXp6bT9p2+aTSlppZvA3jYD+y5ZOwPQs6mTiyNtqJA5cCFCEfHJqgCmkmDeVNgiNfl
	 OxI4S49TFBdgnrfVB3jHO1OlTuWSVnnzk+nGxIstzgwr61fn9I5TqDfhZ1BMOW3UgjTL5
	 24a8IVIYigruFwWSFFPs65GHQDbG2Nhf7ULomGYna2HEEwTZJJepI98ZAwAwIJdvcWNMJ
	 xbl/cKrZRR/UE/3+CX2SmsR4JpQgl0EDBaB/HYjl4wqnRy0TB5CFsXhS7I1Ax2rxjoa8u
	 vTCU6vKR3J3nDXvcuBWVvtFNO5r+Rn+y5d/OdZkXHZQJAOQWjhtTh3+6Wav1Oea4I4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0uzasNhA;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D351606A339
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D351606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0uzasNhA
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f037bc348dso43560955ad.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795590238; x=1796195038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oACP7KwOi4wJuUdzN0kOj5H4T/uZOHxuyB1uiYqEcAU=;
        b=0uzasNhAkBiX5LhlsXmhFVq6ektOu95bPqOSvE2huFfrGZ/6ZQ54FGBVgVKBFkbXFd
         J+N82c8f9n8ZMfB8xGUeA20jj+SR2TiX65wm3GXGTBu2sK8UXQR7y86J1cL4LtZYaiOu
         3/a0KsGac7kX8hWBptRlFUyXZroGjgkrHC8YZvucxejtAvZ2yiqIwW0iBcp7E0ZJVcvY
         z5Ig4fcLYbDrDlEc9LiD8XhGkM2K5cghGudNyaXpGHQEt82j3PEnH6nktwU5pzStMXqH
         RZdmHcNzckISfxef66kAPBzihoruylI9JiiYnnvuchBkiKWNO1GH4jb+LmFnIGznFLuK
         tTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590238; x=1796195038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oACP7KwOi4wJuUdzN0kOj5H4T/uZOHxuyB1uiYqEcAU=;
        b=DyVW8xg/Fcepp0MV8Gf8Mz3H/zR9oP6Pp4pckCfBpVhN/Mg9Db4xmSzFj+WAeHUYDi
         xoFpqZg13HxSAtXbXVNWFNdZHzB2+Rwh9C/s6SScmHalOcXwU92R2KZQqba1NQsaiVXg
         5te915UQ9AGJLkKMO+yXrHmXBPodhkIZO2eOEw3SHvEo02VLMkstIF+LG6Tg+HUfQGtr
         FfgNgOm9qwp8Pyxa973aY331JRJdXQekqhjdMLpYhZ7uEFqIIxyne/D+U6Y+25uVQS8k
         pYBoRCC/R5o7mO+s9CRY7PHlambCLkvAISnZr79GWx82BKpFqCPXm/D5vjWFyNQQqzWM
         NXGQ==
X-Forwarded-Encrypted: i=1; AL+hErF/eVRu49q9F1Gf3DeE65rORdtq4+xgsPSRrYznq/6xEe/q8HUZHUZhHsm+dv0EVUUxiyagNJA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ziLRyXikLu/MBI3Y/CMvv0kXg7IzI7IZwpvSK1hlGKAmvWtyR
	9UGGV7Zp4CJAd7tAYcHBLYOTWItQGTO/lN1fmS23KMc/ZOVJRLM37uQT
X-Gm-Gg: AZFdTZfxTn5mxLPbEpcVZ3q3WD4bFKxl8qC1Kd3lYUHoknblO3DCFTRteRUi1vORTBy
	nAjx9FdCS6PLlIyKsu3XAcZ6dI4ur5wH0AlSnEalqkFgyFCnX01YVIBnBP/moOZVl70L+NVn8GA
	Gn0QLJmkggMKqAhPk2Cs76vS7qCwRdFYXNGT9OvkGcsIeHqB2yl+dK8/PEO7DSSks6RDUFYngOG
	Lp4NlckZ9THd9K7PriGnpJn9hd0gkhd0mIrcxYIwAaMY8bJoJ9jtfNuvmX0SgNTH3lvEYfEo2UR
	DDDapBe4BnN6By8S2Tu1E3UjH4jW1rLlh80ny6got++MqYx45S4lvBr/TJs86HeaP8TgFVZQ3xt
	T9LqxRTrC+ZK2btPo1ByhO+UUk3FixsYFAOOAVicoeHmJNfhrNtZV/2r2ehlYif/2SXRUw+EC5i
	aqba3wvhFpb6EBgkcTI3aqlmX+9jZyncrZcDLctUNkfQqyOr+O+8g6XMsGCATpBWENrrbliKenN
	7fQAmAywSP9s7oqRFSB919TccS32mMU2LzMzzv1NKY5T1V24nGntahSe82R2H5zrRsmX2nwwF1N
	Ivm6zVqk//24Zd1cpAVEsdK+QQymykZDfvhiOLXMgHgO29MQ0XiUL+WF5C2r1+Skwg8KnDul5aK
	sz3n4AdR65uOyx7LqAginsKAnq0MmGi7Z
X-Received: by 2002:a17:903:19cb:b0:2ef:f37c:722 with SMTP id d9443c01a7336-2f03f1cfac2mr177248305ad.17.1795590238501;
        Tue, 24 Nov 2026 23:03:58 -0800 (PST)
Received: from [127.0.0.1] ([180.166.22.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14fc8csm79177425ad.74.2026.11.24.23.03.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2026 23:03:58 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tools: ynl: reject missing regen path argument
Date: Wed, 25 Nov 2026 15:03:54 +0800
Message-ID: <20261125070354.18200-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

ynl-regen.sh expects -p to be followed by a path.  If -p is
passed without an argument, $2 is empty and shift 2 fails without
consuming $1.  The option parser then keeps looping on -p until
the caller kills the script.

I found the issue by manual code inspection and validated it with:

  timeout 2s bash tools/net/ynl/ynl-regen.sh -p

which used to time out with exit code 124.

Reject -p without an argument before shifting.  Also stop if the
selected path cannot be entered, so the script does not continue
from an unintended directory after a bad -p path.

GPT wrote the code change; I reviewed and tested it.

Tested with:

  timeout 2s bash tools/net/ynl/ynl-regen.sh -p
  timeout 2s bash tools/net/ynl/ynl-regen.sh -p \
    /definitely/not/a/kernel/tree
  bash -n tools/net/ynl/ynl-regen.sh
  scripts/checkpatch.pl --strict --file tools/net/ynl/ynl-regen.sh

Fixes: 25b5a2a1905f ("ynl: regenerate all headers")
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 tools/net/ynl/ynl-regen.sh | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/net/ynl/ynl-regen.sh b/tools/net/ynl/ynl-regen.sh
index d9809276db..524fadb770 100755
--- a/tools/net/ynl/ynl-regen.sh
+++ b/tools/net/ynl/ynl-regen.sh
@@ -9,13 +9,20 @@ search=
 while [ ! -z "$1" ]; do
   case "$1" in
     -f ) force=yes; shift ;;
-    -p ) search=$2; shift 2 ;;
+    -p )
+      if [ $# -lt 2 ]; then
+        echo "Option -p requires a path" >&2
+        exit 1
+      fi
+      search=$2
+      shift 2
+      ;;
     * )  echo "Unrecognized option '$1'"; exit 1 ;;
   esac
 done
 
 KDIR=$(dirname $(dirname $(dirname $(dirname $(realpath $0)))))
-pushd ${search:-$KDIR} >>/dev/null
+pushd "${search:-$KDIR}" >>/dev/null || exit 1
 
 files=$(git grep --files-with-matches '^/\* YNL-GEN \(kernel\|uapi\|user\)')
 for f in $files; do

base-commit: 7ccb044c27720d48175577080b851f047ddcfd1c
-- 
2.54.0 (Apple Git-157)


