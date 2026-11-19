Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052692;
	b=mjvYpIuthHZYgg4s/ZNSdyZv4xUpe2iOcpkn4RqLTEcaVohJKPcnBD6xfcb2lXRPHjIW
	 +iy1QTnBUW0Yf6Pi27YGsBvAmGh2yEGNvlt25mGW7wLexAoD5QHJ2F/yWc+Uz/tY1IpQ8
	 bqYt7s94IYclDvTGI9TW4sqUG+c0l72Rql1Xaqq783YXHAuM1GgtVj9Nkmw0Fj0Stw9AH
	 RGT26VaE2LYtyQ9iVshjvAV4NssQLqMkSPxOvha5pBAZKICzTSa3HbiisUsNm86JtMUR4
	 Nc6cRYMtptKqwd32Lq4rtsPNb9EwWCzG13+Wd8sfv9kjKW4RyuFtP9vKrm8wuUB2SGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v4lW71hqhZbV5kfSIsvoYuUxtKOMyzQ4eCZONwiwYEQ=;
	b=c7XsYXo9+OcMDTzmYXmPAXLF6qKW533SHPe13kxB/DmtsRc2gSCRbXqqQLndvCdbZmt6
	 K7uMSk3BitM+Kg6YsBP329twxm/rGyk2w5EQAVrmYKAdWfmmV6WOmHBnqs55wm+aG+9NJ
	 8gS7rKQ4e+XfObPREslWhCZPufeR3GryofWVm3WnPQE1Yc8SCug5OCycnhcCtSF0MdIu6
	 LFVPp1BVms4f0tMynRPTKlxY2sqqnVS3rUO8cCkxgj+skMfiaFQliurjZWReK6TUmcpSM
	 oKq75iMKaAX+KDIgHPlkUbyz03uPFzXzzuDJkaGgbGistb11Pz9AKc4lxrrtWZhMatg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0S5Fq8xv;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B41606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3B41606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0S5Fq8xv
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-94960131b30so193287185a.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795052691; x=1795657491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v4lW71hqhZbV5kfSIsvoYuUxtKOMyzQ4eCZONwiwYEQ=;
        b=0S5Fq8xvdzdIyGOtuLcujzR3VZkCAAfSEBhcw2Uj45F3rswz0rN0S5TE5UNZsMDV1G
         mYhv6qE9hhHECJmdW3UkAngZptulFkzxB9rLC1EAvOnGETQxrEboLplcMoha/Wkztygy
         JMJszfsqhqBiHQkcGiVmql01fGBkHG7oOotwdKiFZOwyXJ+OWVhyw6IrWyDrUWu7a7At
         BBJJEXzDFIfdysXUZ3ukohqjEFRjhN8g7vcG/qEjZ1kR5s0Iax93Uk1xzH533qRYm5XY
         EZjro7eMJXe3BxrJZjyNzIjC8a5QHO293/2nsLV7DoxjSI1LG2kYjTxptk0SYxmIR6T6
         S8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052691; x=1795657491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4lW71hqhZbV5kfSIsvoYuUxtKOMyzQ4eCZONwiwYEQ=;
        b=bpFfzekuVX7byykS2QO9Cdxy/PgOpFqHovPziKcFcDqaGiNqaUH2CR+9lCBkxYdWJP
         n1c+0g5vt2Q6Amp34jHKYIpLhWnHGIFr6b20V//PeZ0nCsQMpQD7U17TK8nLQK9gxeJK
         ASqnBfR4EmB+xHiWDPElpsaDnW7VPEAUc2eVtNJAH8B+9G2hwMSmCKXC0/eLr1+zQ+aD
         GeHHK9xmvHz/3R4P1AS6yn14xE0uREnTEIY6wLRWn6LPeR1dC5+VvYtALc4PWdT/vTVP
         AvvfwAOfuRhzgwfTrzFTJxgUJ5eJxHt9zSNd8e4o4xM5qhDtoWVuzWKb66Zu0scF6Veb
         g6QA==
X-Forwarded-Encrypted: i=1; AL+hErFu5PNh/8u9tqwLcuS3DAfyrGq9cIvacg6dWkpD8DNfFfQ+Sb0ijYjHHDSvBeLnXCJEivWuPFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8U0ra5tYj94xii1K47qJL5cI86w9F2e5a2CoacL2smgbfDNk2
	W1Z0d3FQphqrJ/huf89UVyraz4equxBVjeOnHx0bn2/2wIrxKNyHO/cU
X-Gm-Gg: AYBFou0AXL+jXDPAZZ5ZnoIms7kblhgx/mf778nzRnNJg6AGaUjxjOTEr1CEwcmI/ax
	5wt4afc0ILguxoa3IUUQVohCoNEcmJdEqtyCXGtkwghZr/nqMAQLMq38F0cJToY1pKM21RdmKSo
	7yXuhV2wueMskSa9YbiUeSCfO2bz0cTufOfM4fIlqRqi0BUYm48ggUNA8nb/fwJD3jTPX30Ov3Z
	TMXVS0zFzmvBDxTtUifd3E600h9i4QT+ECsv4hexF9xEikgiV4nkVRof6PUUceKbFl2hyioBOBg
	rq5UJxZG8bWYZuD73k39EumzE9AWdIH4zMUgeq8ifYB2ijO9GcGZKEmZhaN8nt0Pl/GjZaBsEZN
	Mpi2GmjUqTLThlGTQq643Ktgm1zQIVOwmbKaXePSwBW9htzk9U4Ze1cH9eEr1tIYgCkxHLTrYun
	HSOL86h6BTwAUKoGAm1IatTG4xyL1TM+5w/ErQMhchR/ubnoRqZATQnE4T67W98tiGrqE+OEIU2
	jWAfWTBFqEx4U/MD5koEAHXuJaCaMDW6EaHw8ibYzTO9/CZSsigHY9Cd8T9GlK6mv94DtcnvfWw
	VmgyMhncg0pfwa2fORMD4C8sfUjRjQuFEhgRByllxYtizPsv6aN5oQ5AMhcNCJTNohSgSHBVkQY
	=
X-Received: by 2002:a05:620a:258b:b0:93f:3565:813 with SMTP id af79cd13be357-949994af05cmr800463785a.9.1795052690762;
        Wed, 18 Nov 2026 17:44:50 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b743a8bsm320302485a.17.2026.11.18.17.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:44:50 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Larysa Zaremba <larysa.zaremba@intel.com>,
	Simon Horman <horms@kernel.org>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH iwl-net] ice: protect VF lifetime during LLDP configuration
Date: Wed, 18 Nov 2026 20:44:46 -0500
Message-ID: <20261119014446.577784-1-lcy8047@gmail.com>
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

ice_free_vfs() can free a VF or its VSI while ice_cfg_sw_rx_lldp()
is configuring LLDP. Taking table_lock here would reverse the lock
order because ethtool already holds RTNL and ice_free_vfs() takes
RTNL under table_lock.

Look up each VF by ID to hold a reference. Hold the VF's cfg_lock
while configuring its VSI to prevent ice_free_vfs() from releasing
the VSI during configuration.

Fixes: 2296345416b0 ("ice: receive LLDP on trusted VFs")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus PCI_IOV, ICE, DCB and
W=1.

Taking cfg_lock under RTNL follows the order set by commit ae82ccd68774
("ice: attach and detach VF representors outside of vf->cfg_lock") in
dev-queue.

 drivers/net/ethernet/intel/ice/ice_lib.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_lib.c b/drivers/net/ethernet/intel/ice/ice_lib.c
index 773a656ba92e..4068a1aac8e8 100644
--- a/drivers/net/ethernet/intel/ice/ice_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_lib.c
@@ -2207,7 +2207,6 @@ void ice_cfg_sw_rx_lldp(struct ice_pf *pf, bool enable)
 {
 	struct ice_vsi *vsi;
 	struct ice_vf *vf;
-	unsigned int bkt;
 
 	vsi = ice_get_main_vsi(pf);
 	ice_vsi_cfg_sw_lldp(vsi, false, enable);
@@ -2215,14 +2214,18 @@ void ice_cfg_sw_rx_lldp(struct ice_pf *pf, bool enable)
 	if (!test_bit(ICE_FLAG_SRIOV_ENA, pf->flags))
 		return;
 
-	ice_for_each_vf(pf, bkt, vf) {
-		vsi = ice_get_vf_vsi(vf);
-
-		if (WARN_ON(!vsi))
+	for (u16 vf_id = 0; vf_id < pf->vfs.num_supported; vf_id++) {
+		vf = ice_get_vf_by_id(pf, vf_id);
+		if (!vf)
 			continue;
 
-		if (ice_vf_is_lldp_ena(vf))
+		mutex_lock(&vf->cfg_lock);
+		vsi = ice_get_vf_vsi(vf);
+		if (vsi && ice_vf_is_lldp_ena(vf))
 			ice_vsi_cfg_sw_lldp(vsi, false, enable);
+		mutex_unlock(&vf->cfg_lock);
+
+		ice_put_vf(vf);
 	}
 }
 

base-commit: c2c187fd5fa667cedb0b946f5f7a5099fb8e8402
-- 
2.43.0

