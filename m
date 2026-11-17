Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885358;
	b=oX12JF+5JBUvYcE4tvOvgT+it/6DgjXVncrTAitI/bG05PaD+B4tOzjjoZxz42Jj6M1Z
	 yYO73QAuSTTlkRSj1Ct1K/7AKdE+842mu7zT6HE9ssngQHRKlLV2/UkUiScp90R2nEliK
	 nb9Wj2iS3QFFqJ6fKmKWYcjbDFhCOUbkIz+6y6R05T8QrRddF7ptITZfwAhcvvYJtnIqL
	 DmuM5jmWbZqX+O7NMbpF0t+p+9opGj7S5g+x1ry4aa4UhR9+O2jlfcEmopoOUlXIH5RFz
	 8SlW3CVh32FPyb2BgY05uJfNdkoNPsIjlsEuHK5ALDi4j2/ixmNWDg5EH6eJw41IlEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hLTAdn75m/X1XOgHCTgJs4b9yJPhm3jmCX7SAzPgrq4=;
	b=O/MnlVtQUDYUbQcY2RH74cF6PnUnI673vKsIX1gwRPovWvlSDiIS946+rMMif1Vp+0ta
	 5+Mfrw4GUYlv0opKppLQf1AxwIfGAdMUlbHnc77w0NfJsQz7ShNjQvfUv/AF5ULXaJSNB
	 zMHp1z/BZQ+nU7UVxNSrAD2Y+QWBEYiGq3sT2dVE1REfZ8oS4XrebPeT7N2ekeUuhKCml
	 ixEYjWZGDRZpeARcQcTUy0xfJz61iQZ0cUBb226yuPTgE1FdK9QKrxKc0vdXcqO9g87mj
	 mPrt++jc2Yq/74RobaHDUgIBf0HGgCfb4rGb3r2uv8W/rTt6PlPmnLPBwVdyCeNIs3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tPTwUZ9L;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12826606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 03:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12826606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tPTwUZ9L
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-536717a4d83so43576931cf.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 19:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794885357; x=1795490157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hLTAdn75m/X1XOgHCTgJs4b9yJPhm3jmCX7SAzPgrq4=;
        b=tPTwUZ9LEzc6IDdq/15oD7EzCpNa/w0dh2Ny3Vgym5tzyEIi6koNn38x0qlRyVXY2Q
         1EBwRAZrT/WirZcTseLNVR3rNQpnkZpxSD+uNODvKKuT4qsoNfbhLO5pIa9hTgibNX5Z
         sv0r6rMt9kfuak+mj8+j8yyajnk32UpKSfQv0HIyc+fsWN/SOwqch13m68KfJ5d07BL4
         Dfnw/yQDy/r/9b65mUdI8dyThxbbji8PGeU2uDYKPGIU1493vluMYUi3Jhw+zvex1s2U
         asvnCWvIdcrCsKYSyJjDp0MgjmqnElUz22IKTud8zZ7up+15UpDUuz9D7Vf/ma2zeT3U
         PCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794885357; x=1795490157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLTAdn75m/X1XOgHCTgJs4b9yJPhm3jmCX7SAzPgrq4=;
        b=MD+jp4t91JLtIgLr7f1O4mLJwTp52DEMmpr3Xxidz6EK889FuGiOj0hCOr1rgnC/ef
         Ne0D3GO1Rd+9Rvisw9Jx60entLPbobDTr32yzcuqMeUsyZfvT8ElO0dE9TGBueV+Ni9M
         Er9AfqcYHNpjfFrW9PDpQpXs9yNDS1bLzQXXNw0mIwRQ5oDIV7b811QtU4woUy/YAbvQ
         gtQA+QyeBTEu/woJs9nodZv/47re1wfzb+eklhQtwvroZS5ycG93s/WfyL4y1lVIqZvw
         x1ISP5O9JEQqgmlBsDKxyXLsWXgflrKEZvx52Nw5nVai2+7Bm2pEz7W/CSudk2DmEiR2
         vjow==
X-Forwarded-Encrypted: i=1; AL+hErGjuYxcDlKo6Eq/x4plVpckqmzPHiUDiwEOGzMvYNJETS6/KOS16v6fqB1I0ONguSW5YKNksdc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qqabu1oumFpmhEk29vMrM+oAcEhn/dLs3i7PA3efA6QxTSVEn
	brb6S9ggxB1cHjS6Fm4dq/Bnx7xdZJZj1Ke8Sqhnth0FWwM6Z65KPHU3
X-Gm-Gg: AYBFou1G/6wR8aZ3wIX5BUUUF1yF0/ppDk1NRV2olgtASiZGV0rSZQwSjQT1cC1WhHB
	rN4qSdMs/1i0vslP5XZyoSiICsJJDRvAYJmVMXmNzZPoeeyifKCNEvLTQwbVJlngpQYYAEc370C
	BDL5oQIKQxKR+9zfuWFjygMbir5esI/aCMX/kyMT47tabWU6A5oLDGRUKijMAgjq8olFy8HJJ6r
	t6XHb0llwRzZ/0gLN0EHJkEalgFybACGBc7Hf8+pLMDwUgvfCb0/3oKhBykvxRMXzc8Hzf6YlDV
	ToGbWSlWPdX/xr7ZOdT2eg5uJ8gOsdV58HFBYaMPN5DMvcu9n/oyChUXa/RFhSJdEhBdBU7Nklp
	HAefbCAxHrLIrU1PNaV4y4zpB/BLZScuYFkqIy5FpuquZq6AFGadCWLr264afflZWemMFlZt8+e
	biuPejKyBtN84Ua4God7fJvdfJHpXGa0qeMKbK4tSMmOXgoXnTi7AsaRnz/ez1Vn629mceT5ho3
	2/eF1fLZJmX7fqYj9Ow+m6fXl18jN8uEBd9ornt37hUO4I2V+unpQoZPzRH3ZJV93/zCQFCmGSs
	hqbxfQTZizWWO8L5blTNj9IVAe3NDRONazY0jbZd0ioiQH2vZNA7n5+hsfwxVAPo/U3koB1A7uH
	0Shtbp7ppNISem01Hu9hg
X-Received: by 2002:a05:622a:14c6:b0:55c:fa5a:b232 with SMTP id d75a77b69052e-55cfa5ab3b2mr121881541cf.4.1794885356928;
        Mon, 16 Nov 2026 19:15:56 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23da64c1sm99291826d6.37.2026.11.16.19.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:15:56 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH iwl-net] i40e: hold mac_filter_hash_lock while validating VF cloud filters
Date: Mon, 16 Nov 2026 22:15:53 -0500
Message-ID: <20261117031553.1728084-1-lcy8047@gmail.com>
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

i40e_validate_cloud_filter() runs in the VF message path, which holds
neither RTNL nor vsi->mac_filter_hash_lock. It looks up the destination
MAC with i40e_find_mac() and walks vsi->mac_filter_hash for the VLAN
without the lock. Meanwhile the host can change the VF MAC or port VLAN
with i40e_ndo_set_vf_mac() or i40e_ndo_set_vf_port_vlan(), which delete
filters under the lock and free them in __i40e_del_filter() or
i40e_sync_vsi_filters(). The lookup and the walk can then read a freed
struct i40e_mac_filter.

Do the lookup and the walk under mac_filter_hash_lock, as
i40e_vc_add_mac_addr_msg() does, and do not use the filter after
dropping the lock.

Fixes: e284fc280473 ("i40e: Add and delete cloud filter")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus PCI_IOV, I40E and W=1.

 drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c b/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
index 74b6c0ed8480..da1f1a9c4124 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
@@ -3624,9 +3624,11 @@ static int i40e_validate_cloud_filter(struct i40e_vf *vf,
 	 */
 	if (mask.dst_mac[0] && !mask.dst_ip[0]) {
 		vsi = pf->vsi[vf->lan_vsi_idx];
+		spin_lock_bh(&vsi->mac_filter_hash_lock);
 		f = i40e_find_mac(vsi, data.dst_mac);
 
 		if (!f) {
+			spin_unlock_bh(&vsi->mac_filter_hash_lock);
 			dev_info(&pf->pdev->dev,
 				 "Destination MAC %pM doesn't belong to VF %d\n",
 				 data.dst_mac, vf->vf_id);
@@ -3641,6 +3643,10 @@ static int i40e_validate_cloud_filter(struct i40e_vf *vf,
 					break;
 				}
 			}
+		}
+		spin_unlock_bh(&vsi->mac_filter_hash_lock);
+
+		if (mask.vlan_id) {
 			if (!found) {
 				dev_info(&pf->pdev->dev,
 					 "VF %d doesn't have any VLAN id %u\n",

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

