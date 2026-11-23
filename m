Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436858;
	b=AKx5gzlBYtVoDw95zh0FYXOojDOI7wQcFONHTaUPoeQy+8K8cVQU/NF07A/DtZICqfyl
	 jN9xsXt46bcslEhBYLmMMXk1iVEpAHYGKUHc3Ao2kveSzFVgIMPXr3iI9x0cF+vB556vM
	 ZEpSjMvJMUrnswpAYBBl/VmbhZkqvSeXBrltw2rjY0yzrajkX+8L3cD9ZcwOiTleEF8RJ
	 QucxbYhSPKlKyi9RIHxneSzWvA729SddUFFDm3cn7/F/WjrS4mdp3Uo+hmo9+45Ih5HyJ
	 s15oFyErYMvmV2kiSL7z3JZvASMibkIrKLHbpZPoMvox6DFXpLaw1jaoyY/GRPVfcng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436858;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yX9CeG59OS8ilGsOns30C8i4+axcyTEG7TgTi3PMHLU=;
	b=HOyRYkHLxoz3yRKCMKy+W0za2820ryoGp9Kfrpjlq+yIn+3ojO/hypz/G3L2eZHasiDr
	 7ePF4um1PmQrmrFNFurugp4CPysngq9XwH1pH68/2Gbfj72ZpFLgsvnSy8bf4OjsGEBk8
	 5P7hoBL+j/aT9xzpAQHV8ja1SBk2tF1Z3mkKxO/6jcrQLfr9Dw6mhPfBza1df9v2SIzgn
	 hAK4usM3E5VkFjT2X+zL5GWD8XLC7T+j/IhrZIIMy3J8RWuIQJVn2nNPMCJXfk11QL0g5
	 AZIUZcFirgYRX47upNsyE6HaPWza90RagcYqTX89Q+BWGERqoeXY7NNwTi/1ksi2Zog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=7xz.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABDB606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ABDB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=7xz.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38190551625so6704311eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436857; x=1796041657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yX9CeG59OS8ilGsOns30C8i4+axcyTEG7TgTi3PMHLU=;
        b=pW3vnIizgRsjrcqcFLb9Kl4GNw9yrT0AyZ8WMXBOyILTcPY03XYz6kRRPxD/6VSwyS
         13ljircqDz5XLQDzCI0nRnC9hVORSJBiCJhGbwyrDSulMqgk65EUWo4oVVBrLVcITVSx
         yZe33GfX3GcNgqkQv7zYoQqxYUvaTcYucOcJV2xxI9KZHUd2Bx26Ys6yPMFPVi3KktDz
         jiPmmTsvWrHujlmquyANvXiO4YE4I8xYOCNhJmGLTLXddYWrIQ7/VgrW1Fgb0bpdj0ie
         98MXLU0ahmqXfXV5rLXCT10OzA4VKPwZ2ADYhbAip7zl7O3iR1anBnVauitcg94qBc3n
         dS8Q==
X-Gm-Message-State: APuU4Z+PYnExFKkj+Xw8TBj8mL4cKk+Dv2fJG6LmmgeqZe2RXBFl2BgW
	1OpxJ3eZw9sA85twyRSS4mOHShJcoZUGFk0AZzBnYazJrx4MJJS3t0Ft
X-Gm-Gg: AZFdTZdMPBvgIL0s5E3W/SzqhpYnRhBjLdg+lvs5cvR/yPBCHK35kuOToRWkUO83ZWn
	cu2JIUMlMuVaJimlF2QXUS/j/vidVJvvN6mhIfJtUyDZCgY8hAeFYyNSskz1eRFS/nKNSIMUIVX
	5xTmnNguAADQ7u7PgwKNOg6pxvir3JQx3T0kmqIlBZmBM+CgS/KifKUWjKxIw041ittS1CLAak3
	+t8mbkTF+uGALNoI51fpCT0FJBnRGMgXJ1O7+F7WRFQxai49HU6mZfn8mNVwfkiZC7wVVngmsNf
	lmqIRXv1wTjywhGQzHjqDXv2rCEnO0//Ex6OZzMQPns7S0vUy2aCkSqTQQnU/QKA5yEN/KPjMwg
	uHywFYL+8LRvnVEgI1Yq/VWPSHey5ZkpaWvb+wzAiN7+pcDIGFTa7jFI2oNlfsbbmJqMuHrlajL
	JMChWAkjWW6pxv+d2kHpr0X/Lvb56v5bWIg9zSjBS+67FbEpVYpvFwV8j131nii96uNHDx7Q7L6
	8Ep+PptGhLJr7GmFNDggR1g3DsGyYRz2K2MlX7ZWDV7Sd2DwiPrWHxIltX82T7N3QKYPx+nJfIe
	YDRsEyPQRccC5kQiKt6fNSm0dl5MFYYsJJl5Et6UDvhRjQ==
X-Received: by 2002:a05:7301:182d:b0:386:b801:cd06 with SMTP id 5a478bee46e88-386b801cd3bmr1163094eec.40.1795436856700;
        Mon, 23 Nov 2026 04:27:36 -0800 (PST)
Received: from DESKTOP-SA7O5VQ.tail87cff0.ts.net ([211.202.142.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm25212717eec.1.2026.11.23.04.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:27:36 -0800 (PST)
From: Sihyeon Park <me@7xz.dev>
To: sam@mendozajonas.com,
	fercerpav@gmail.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	willemb@google.com,
	delphine_cc_chiu@wiwynn.com,
	Sihyeon Park <me@7xz.dev>
Subject: [PATCH net v2] net/ncsi: bound channel walks by a valid Channel Count
Date: Mon, 23 Nov 2026 21:27:32 +0900
Message-ID: <20261123122732.2971-1-me@7xz.dev>
X-Mailer: git-send-email 2.56.1
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

ncsi_probe_channel() and ncsi_suspend_channel() (state
ncsi_dev_state_suspend_gls) walk the channels of a package by
incrementing ndp->channel_probe_id until it equals ndp->channel_count.
channel_count is a single device-wide value, copied unchecked from the
Channel Count field of the most recent Get Capabilities response in
ncsi_rsp_handler_gc(). A controller reporting a value outside the valid
range breaks these walks:

- Channel Count 0: in the suspend_gls state channel_probe_id is already
  1 when it is first compared, so the walk never ends. The driver keeps
  sending Get Link Status to channel IDs 0, 1, 2, ..., a single
  link-down AEN never completes the reconfiguration, and NC-SI does not
  recover when the link returns. A down/up/down flap in that window also
  logs "Wrong NCSI state 0x100 in workqueue" and stops channel
  monitoring. Because the value is not reset between packages, the next
  package's probe also stops after Clear Initial State on channel 0,
  so its version, capabilities and link state are never read.

- Channel Count above NCSI_RESERVED_CHANNEL: the walks send commands to
  channel IDs past the 5-bit channel field. NCSI_TO_CHANNEL() does not
  mask the channel, so channel 31 becomes the reserved channel and
  channel 32 on package 0 goes out as package 1, channel 0. If a second
  package answers that Clear Initial State before it has been added by
  the Select Package response, ncsi_rsp_handler_cis() calls
  ncsi_add_channel() with a NULL package and the kernel oopses.

DSP0222 defines Channel Count as the number of channels the controller
supports, so a conforming controller reports a value from 1 to 31; these
are robustness fixes for non-conforming controllers, firmware bugs and
emulators (libslirp's NC-SI responder, used by QEMU user networking on
the Aspeed machines, reports 0).

Clamp the stored value to [1, NCSI_RESERVED_CHANNEL] and warn when the
controller reports something else: a controller that answered on a
channel has at least one, and channel IDs stop at 0x1e. Also terminate
both walks with ">=" instead of "==", so that a later Get Capabilities
response that lowers channel_count in the middle of a walk cannot make
it run past the new bound.

Tested on QEMU 11.1.3 romulus-bmc (aspeed_g5_defconfig; unpatched: net
tree at e203d8a4751d, patched: af6737b90668, no net/ncsi changes in
between) with a minimal initramfs and a loopback NC-SI controller
emulator with one or two packages of one channel each (pN = Channel
Count reported by package N):

  kernel     count       event   result
  unpatched  p0=33, p1=1  boot    oops: ncsi_add_channel(NULL package)
  patched    p0=33, p1=1  boot    warning; p0 and p1 probed normally
  unpatched  p0=0,  p1=1  boot    p1 channel 0 gets CIS only
  patched    p0=0,  p1=1  boot    warning; p1 gets CIS, GVI, GC, GLS
  unpatched  p0=0         A, B    no recovery (GLS to ch 0,1,2,...)
  patched    p0=0         A, B    recovers; same commands as count 1
  patched    p0=1         A, B    unchanged; ch0 GLS 58 per 60 s

(A) link-down AEN, link-up 15 s later; (B) down, up, down 0.5 s apart,
link-up 15 s later; measured 180 s after the final link-up.

(CIS: Clear Initial State, GVI: Get Version ID, GC: Get Capabilities,
GLS: Get Link Status)

An AI coding assistant (Claude Code) was used to analyze the problem,
reproduce it in QEMU and draft this patch; I reviewed the change and
the test results.

Fixes: e85e271dec02 ("net/ncsi: Fix the multi thread manner of NCSI driver")
Signed-off-by: Sihyeon Park <me@7xz.dev>
---

Notes:
    v2:
    - Clamp Channel Count to [1, NCSI_RESERVED_CHANNEL] in
      ncsi_rsp_handler_gc() (Sashiko review). With only the ">=" change, a
      count of 0 still cut the next package's probe short after CIS, and a
      count above 31 aliased into package 1 and could oops in
      ncsi_add_channel(); both are reproduced and fixed above.
    - Drop the v1 claim that Channel Count 0 behaves like 1 with the loop
      change alone; retitle accordingly.
    - Link to v1: https://lore.kernel.org/r/20261119100625.72505-1-me@7xz.dev

 net/ncsi/ncsi-manage.c |  4 ++--
 net/ncsi/ncsi-rsp.c    | 12 +++++++++++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 1d63958c4429..c5cf2ca0385c 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -520,7 +520,7 @@ static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
 			goto error;
 		ndp->channel_probe_id++;
 
-		if (ndp->channel_probe_id == ndp->channel_count) {
+		if (ndp->channel_probe_id >= ndp->channel_count) {
 			ndp->channel_probe_id = 0;
 			nd->state = ncsi_dev_state_suspend_dcnt;
 		}
@@ -1491,7 +1491,7 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 			ndp->channel_probe_id++;
 		}
 
-		if (ndp->channel_probe_id == ndp->channel_count) {
+		if (ndp->channel_probe_id >= ndp->channel_count) {
 			ndp->channel_probe_id = 0;
 			nd->state = ncsi_dev_state_probe_dp;
 		}
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 33921dc169e3..84cc8ac0ca2f 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -829,7 +829,17 @@ static int ncsi_rsp_handler_gc(struct ncsi_request *nr)
 	 */
 	nc->vlan_filter.bitmap = U64_MAX;
 	nc->vlan_filter.n_vids = rsp->vlan_cnt;
-	np->ndp->channel_count = rsp->channel_cnt;
+	/* Channel Count bounds the per-channel walks in ncsi-manage.c, and
+	 * the channel ID is only 5 bits wide with 0x1f reserved. A controller
+	 * that answered on this channel has at least one channel, so keep
+	 * the value in [1, NCSI_RESERVED_CHANNEL].
+	 */
+	if (!rsp->channel_cnt || rsp->channel_cnt > NCSI_RESERVED_CHANNEL)
+		netdev_warn(ndp->ndev.dev,
+			    "NCSI: Package %u reports invalid Channel Count %u\n",
+			    np->id, rsp->channel_cnt);
+	ndp->channel_count = clamp_t(unsigned char, rsp->channel_cnt, 1,
+				     NCSI_RESERVED_CHANNEL);
 
 	return 0;
 }
-- 
2.56.1

