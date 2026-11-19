Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126237;
	b=LIX7tfGhzfGsrLGDDbNTiOCr6s43GpX5w0hQo9Kzp2PPspsovkA3CtaI4ge2YtXWPMVN
	 MdMIjA6OTl6gs9diC0biSuewBVvJ2Xe+KSZMImegcp8cdA3DfneLwhZZxX4d8SnsEel9H
	 ClTpiN7nowmKr60qdkkIEs73ovCy/n+/roSWO0jdYF854i81ziJGhYF3f+XSMD7T2qqGI
	 qtiWqTAL91PdX3lx2eBC7xAYx4pp93Bk5aWowDmD2Sj1qt21VrucwtKupTjh8T3VHzzsj
	 AuR5Ltps467PMUDdCnLrQeTl3EuVkapln+IEPEkEFSHtTt/G/o2ykgnuq7xPL61voIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PozfLRKUwIGEEJfHlmCmIlVCz9iF4PxAkid3tzd8cgA=;
	b=cdC4UxvCQ0Ic/GJz/hgFi/mLy1chCG0xmTr8OPF1Ew+5qrDZr7fY+qOCpaI0FV/LU+DP
	 o1gI3l3D8D3ZfblM5J3YuM0S9GzTx+ro07NsNXbEBy8ZHgOqA7xYKFGvAqQji/C5UGHdI
	 Ef/up7hoWKlOY9iJHRrH1xUXA1O5XADlRYhdhZ5b+ndrPdjAdQPFI+1mHQgg8mvWwAK4d
	 35ACxS1yrmwNmvWF8k2EG3H7sjcMoCF/qP3CBvur2s20/CbxagnNRqyqwRGCTY7+VvDeO
	 7jkeU4bupLkxWD4FmBbjS1k0j9Ec8LIQt2i5eJVj70LdNZiq+LhKTx10czGEZmR4BEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqwJUfRw;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71733606A331
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71733606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqwJUfRw
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f03920c477so1597035ad.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795126232; x=1795731032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PozfLRKUwIGEEJfHlmCmIlVCz9iF4PxAkid3tzd8cgA=;
        b=hqwJUfRwjorJ/7PuHtBi91EB0LPdpJPOVeRuRxjpJGTzGYQWrlXgbRR7lgFvNLIsen
         ji13BkndqjcoST+huRj91mbs+UqomMlgL2lfsCxkb1iCS3d70Ii3YhDKRe3Y+Wph60Ux
         50RFfiSzG2DXIAyrU6+MblKmUU8UNE/9CxVP8/Q/OsvFBA7MpeN8aORfGw+DAwIFtH/Y
         ev9ocqT/L37UKAdSKCzey7JRoZfRUN+kZD9ECuvr26+MfHN3FM0UesGLb3JYopLfU563
         o0plyv1/qFAPGKWwuHXic5heHHvT/GHVaohF56qnlJpCs7mn35s4cqK0OjBLpaOhqE+b
         x2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795126232; x=1795731032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PozfLRKUwIGEEJfHlmCmIlVCz9iF4PxAkid3tzd8cgA=;
        b=olrMTpgYw5oS9njv182VNUPabhrqj6RJU57kvg/1hdWCDnGg7HjZfbGXEJ5fu9BBnh
         oqC3XQQYfsFcoXh1EuS1JPFGotlcHWS7IPYp64fIFiHfnNmlEQhqxeF8b7On8MVuoCNg
         avSiMUEhq6y33gwXmDPkP+mukDfqweKXnvEQvs1kJCOJjhGu6cOfY/ouVMw6qvlR9Hnl
         p8pp0D+gfDDKOv7u/Tp2lD18WO7kQ1nzgFu4T4WLu9dQ2/FrmduAQAXGtoEvZJnC/7Yi
         x86yVs2zOgGuhMd0tpm16C4u28y8v1YaejtUo/zH9uDpljsUH4iVQVETzunmv+Alw2Sw
         VnoA==
X-Gm-Message-State: APuU4Z/38rMr1232jkVrkkVMT6ZAqAzZbBNfukLJbk7KVbnGiDA3hd1u
	ocsK1+xh2LqC/yLG7ZmDPi+E7xizT6mun9I3+M5g9b+W5IF+JQhWUM0OCDT5td4M
X-Gm-Gg: AZFdTZdLkh7qcswVtV7+pDfXjNKS8HSxM520WsOxgmzS3p3ezKRjUPeuj49HozKZrbK
	chIHaVSDadROd8QQ35XFoMlUDy5NjTXMsTIi9V4L2YYSA3ul01lV5Gn5/B6GBIlGxwyKy/c6/0v
	uxq7FrYvg3K0tTndaM4ztW/uYa+3KpNGhGbL57SMTsXrh/IOdEtWTf91r18dzQYsa82ZZsW+ToD
	LWWGvFg+f9a96xDSEgW9eB9g7cS4fHSYTFK7PBchPelvclupF+UlkOgWJuv3LtfaFbGIVsNknvK
	7/KVzD8zWzNvNceMcPjds1nVNm54UI3pVuuZkuJmoMMCn/O3LgOD1aNPLYjPPAHN0hXfWMTCs6m
	4lMS6AvkhzB+DNyeYR2JwxpYt35LTk0XnVssgddB+zi2HEqur9DL1DLN1ms1No0pUQV0DPNjQGh
	BMDgQCWpzeDO8XoL6YfegeayROeiX/qQ2B5kcOCW+bv4V1awWsPbwvItPZLaLyj9gmSXnIWdN3U
	gGVZNSFa5Tjvg8QMhlMw45c9QKNZxBoXHt2Lk+yjyUQ7Z/m+kGZi2y38rmCvIf6uaNade1Qrpus
	dBT4ayuRRoHsps7uWkyhQBjpEemYe2PRatujVtMTsqWZIidQAJyb
X-Received: by 2002:a17:90b:35d1:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b41cb04e15mr702808a91.48.1795126231531;
        Thu, 19 Nov 2026 14:10:31 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2ad2sm5276385ad.16.2026.11.19.14.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 14:10:31 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net] net: dsa: motorcomm: Read the port PVID instead of bridge's
Date: Fri, 20 Nov 2026 06:09:46 +0800
Message-ID: <20261119220949.1123168-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The driver passed the bridge master to br_vlan_get_pvid(), returning
the bridge's own PVID (VID 1 by default) instead of the configured
port's: deleting a vid that equalled the bridge's PVID wiped the port's
real hardware PVID, and a vlan_filtering toggle programmed that PVID
into every port.

Query the PVID from dsa_port_to_bridge_port() instead. Clear it when the
port has no PVID left, instead of comparing the deleted vid against the
bridge master's PVID, as the bridge unpublishes the PVID before the del
notification.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index c753c746490a..b12bf32f8896 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -948,18 +948,18 @@ static int
 yt921x_vlan_filtering(struct yt921x_priv *priv, int port, bool vlan_filtering)
 {
 	struct dsa_port *dp = dsa_to_port(&priv->ds, port);
-	struct net_device *bdev;
+	struct net_device *brport;
 	u16 pvid;
 	u32 mask;
 	u32 ctrl;
 	int res;
 
-	bdev = dsa_port_bridge_dev_get(dp);
+	brport = dsa_port_to_bridge_port(dp);
 
-	if (!bdev || !vlan_filtering)
+	if (!brport || !vlan_filtering)
 		pvid = YT921X_VID_UNWARE;
 	else
-		br_vlan_get_pvid(bdev, &pvid);
+		br_vlan_get_pvid(brport, &pvid);
 	res = yt921x_port_set_pvid(priv, port, pvid);
 	if (res)
 		return res;
@@ -1098,16 +1098,16 @@ yt921x_dsa_port_vlan_del(struct dsa_switch *ds, int port,
 	mutex_lock(&priv->reg_lock);
 	do {
 		struct dsa_port *dp = dsa_to_port(ds, port);
-		struct net_device *bdev;
+		struct net_device *brport;
 
 		res = yt921x_vlan_del(priv, port, vid);
 		if (res)
 			break;
 
-		bdev = dsa_port_bridge_dev_get(dp);
-		if (bdev) {
-			br_vlan_get_pvid(bdev, &pvid);
-			if (pvid == vid)
+		brport = dsa_port_to_bridge_port(dp);
+		if (brport) {
+			br_vlan_get_pvid(brport, &pvid);
+			if (!pvid)
 				res = yt921x_pvid_clear(priv, port);
 		}
 	} while (0);
@@ -1135,19 +1135,19 @@ yt921x_dsa_port_vlan_add(struct dsa_switch *ds, int port,
 	mutex_lock(&priv->reg_lock);
 	do {
 		struct dsa_port *dp = dsa_to_port(ds, port);
-		struct net_device *bdev;
+		struct net_device *brport;
 
 		res = yt921x_vlan_add(priv, port, vid,
 				      vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED);
 		if (res)
 			break;
 
-		bdev = dsa_port_bridge_dev_get(dp);
-		if (bdev) {
+		brport = dsa_port_to_bridge_port(dp);
+		if (brport) {
 			if (vlan->flags & BRIDGE_VLAN_INFO_PVID) {
 				res = yt921x_pvid_set(priv, port, vid);
 			} else {
-				br_vlan_get_pvid(bdev, &pvid);
+				br_vlan_get_pvid(brport, &pvid);
 				if (pvid == vid)
 					res = yt921x_pvid_clear(priv, port);
 			}
-- 
2.53.0

