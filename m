Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145955;
	b=jBMeeVFHgyw2NcN4lwiBdQUbz3CUTof3WjxzdER6fuPKw+ukhgO/TuKR1nN8EXHO0j4q
	 zWB6h1FE+wxZiOeruqcgKnVbMm8ZZkF890OSBpWs2rIGtCsJDbxVgfJKGQea8uEUsPYhX
	 hPVpKtrh/NXwh30CGb5soJm8+nM14X385Obn1uiRq7mW1GmB5LVIIJ2s0ZPRJkFw+7XEp
	 B4IutkqP9mBrwDEaOV3xbbtcDJkVLO850dproAyFHQYC2y5ZgdtUCUCIeHqCaWEa0U7Iy
	 CHO6EJ0KDF6z+HhE7TdNO6jFmcJoBl/Qb1MfcBuFNaL5dmQTApNImFVHANte+cuPqrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BmL15il61u4HjD5Xp8Z160Kx1ZRWIG5s4ZIJmdF45ZY=;
	b=05WqpLcyuQVZqD3eN3KQ3d6JGg2lJZHgxr7RssgE0eUpcXs6tcn7GZD3cfV/epazB01H
	 tqbqVRMOGKcmTM75+xSyUznHJlZrI4jWuOnduGQCCf3zrXCChT9iaQcFAM3Tnkt//7Tpk
	 0+apCeXDeReYPvi30Ocpka7kC2evKNJ9OK6YjqHWgiNpOYrmrX6vVlB57Fv5J2cN0qd87
	 6NONTjyCnw7ESPuXFWMYdMbTOOWWWhuqkGLrOxtRpjGxUfk22njIynmVaYzYvrvySxa4a
	 J0013kpaSIphz1XTiCwr1XbLKi20OCzMIyOtSYwyFFSYp2eHgMdAqlzDoKfAT2RD78Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kw/UvP5f";
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D55606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15D55606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kw/UvP5f
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5363316fa0cso7230481cf.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795145954; x=1795750754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BmL15il61u4HjD5Xp8Z160Kx1ZRWIG5s4ZIJmdF45ZY=;
        b=kw/UvP5f8Ssgneb1e0sJ8ueeZn0zln5BkV/sY6CsHk10xIEt6eyS5r78VBD8FOj7Gj
         Li9XS9cTTnooaPibSqVDZgJUZBbZnsUJw4I1+auAUkWjLo0rTbVAgyssqR0AN2/kti95
         8tD5xxT91SnRVgUeWk0djds65QgacIBjiQBTnxqKFSZXKgg6nJgaTZ+hpfuH3NYcOHJU
         +Kl9gzVfHQtINHzHnDputgKD5kgMLUqsmJEVXYge9zh7g99+bZ3FKAeIaWYkhiJ7JurC
         Za7y++vI0gWvyglEsLj5Sbsae2ngj3W0Pi7OJ3ttDuoM2tM4rCLVZFUmVhPyZMkZ8H/+
         rDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145954; x=1795750754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmL15il61u4HjD5Xp8Z160Kx1ZRWIG5s4ZIJmdF45ZY=;
        b=C/ZkHZ1P07nkWTOk1gdQ4KnfZOatn3arRfjBgFeyRbK2+agE2Q8gXmLoz8IWEhUEwo
         HnXKWe6FOvapOGqkPuNLxrXYz+3s9K529sDIq0cypTX9ft2sVo+/+DqskNqH5+LxDvao
         K1md9uwMNkHoxNKxyKjScEnvxwBcbNv4d/EGt22FrtNhlrS+wPy9HeuCj0ooBJesouq1
         pnUAv2yKUB/yq8NA4wXkltkdsjSujVM6AoUWam4bQ5kRYFdt4HFeNw9M/pj5NLjhvcdJ
         esWirg5JLz4Q7sfyvio8kiptqkJTuIiBY0flhzErCGgfEMPoPLktrnFZXOLklx6opsPH
         xCjw==
X-Forwarded-Encrypted: i=1; AL+hErFxvzwTqwp4ge6Q8QD+R2HBRNvcxEea+KX1FsH1wTNxTBAcp1sqMv1c7M6pZf4Ct84Whfuv6SQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lau2VAoY159FcQ2r4fUBbvUJbXsQ51DULT/3Klbgpr5yve/Ap
	Oj1mh7LwkVLpaNUdr5JC30lwsvPv8Tmz8za0LiNvZKBt/AV91BEuVCGM
X-Gm-Gg: AYBFou2YF+hGc/SIMP80gXsuQ8eFqja9M+HuvEPRnbvovy9+X1nbTjyjlmnrla+TlEW
	1C1rft0UNE5jeG2MIR0yWpg0Owbv+qpFnQwe4/zn1DxyXg7pdaiTGxwnRkGyzidmH10opFckGst
	aVtenddz95WF7zQmNOB1aS7fWzRC7tdJGL0XUKPPokIUznHH7KvRQGmWJzCGHjo9722lCS2brrn
	/LSw4GWmN2nEaA5OgBNCesZJEHWgWjHrdwvsn+fXt95OwDFQryJqFW8Hsveu3937zKdi9LHSxag
	PDq3J4rqV9eZupTxvVu1Drp5E/5Z5hW9cig1P5vM5J3i4BA/CprZw8X6n59nxD9aCsH2UnZ7G+G
	ZvFFoMDud/BQjjGhR7CtXVM2zSsBcGikZQOvn5YsUlVpCwp+P9qiUIJ+w9SH6chcEcsY6BgyPQy
	CExzKKcNClhSGaa3TWVPmolaoNDtbWxVKjyG76H9PH4qs4Ydypt4YJbSHqnXb62MUC4jTNcmclu
	gfbNm1zN27f1JfAO6tzs2Nfb6capF/rXCFGzzXSOyXVauQCJVopqZffBGavHNDbqlzI4v+reqkU
	KXzr+ZuWg8iGNlQxcnW5eHlDvWqaDwZidOWLoXqPCqRvIbCUqVpDI+xxkoLOhveP9+6nQ0VJDo0
	=
X-Received: by 2002:a05:622a:313:b0:55d:1944:a2ab with SMTP id d75a77b69052e-55d76a5af8dmr35213321cf.49.1795145953682;
        Thu, 19 Nov 2026 19:39:13 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7888fb27sm11535941cf.25.2026.11.19.19.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:39:13 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Marcin Szycik <marcin.szycik@linux.intel.com>,
	Dave Ertman <david.m.ertman@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH iwl-net] ice: hold a VF reference while creating LAG placeholder VSIs
Date: Thu, 19 Nov 2026 22:39:10 -0500
Message-ID: <20261120033910.1731258-1-lcy8047@gmail.com>
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

When the secondary port of an active-active bond comes up, the driver
creates a placeholder VSI for each VF. It walks the VF table with
ice_for_each_vf() while holding only pf->lag_mutex. If SR-IOV is disabled
during the walk, ice_free_vfs() can remove a VF and drop its last
reference while the walk still uses it.

Taking table_lock or vf->cfg_lock here would reverse the lock order used
by VF reset, which can hold both locks before taking pf->lag_mutex.

Iterate over VF IDs and look up each VF with ice_get_vf_by_id(). This
holds a reference until ice_put_vf(), keeping the VF alive through
placeholder VSI setup, even if ice_vsi_setup() sleeps.

Fixes: 28f073b38372 ("ice: Implement support for SRIOV VFs across Active/Active bonds")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus PCI_IOV, ICE and W=1.

 drivers/net/ethernet/intel/ice/ice_lag.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_lag.c b/drivers/net/ethernet/intel/ice/ice_lag.c
index c4b8af01e2af..e0803c2a3e8c 100644
--- a/drivers/net/ethernet/intel/ice/ice_lag.c
+++ b/drivers/net/ethernet/intel/ice/ice_lag.c
@@ -1913,18 +1913,24 @@ static void ice_lag_monitor_act_act(struct ice_lag *lag,
 				struct ice_vsi_cfg_params params = {};
 				struct ice_vsi *nvsi;
 				struct ice_vf *vf;
-				unsigned int bkt;
 
 				params.type = ICE_VSI_VF;
 				params.port_info = event_pf->hw.port_info;
 				params.flags = ICE_VSI_FLAG_INIT;
 
-				ice_for_each_vf(lag->pf, bkt, vf) {
+				for (u16 vf_id = 0;
+				     vf_id < lag->pf->vfs.num_supported;
+				     vf_id++) {
+					vf = ice_get_vf_by_id(lag->pf, vf_id);
+					if (!vf)
+						continue;
+
 					params.vf = vf;
 					nvsi = ice_vsi_setup(event_pf,
 							     &params);
 					ice_lag_aa_clear_spoof(nvsi);
 					lag->sec_vf[vf->vf_id] = nvsi;
+					ice_put_vf(vf);
 				}
 			}
 

base-commit: bf9edda440e747a4a9b351656a395f0b77cc1fef
-- 
2.43.0

