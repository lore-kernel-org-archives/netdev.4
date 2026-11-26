Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716451;
	b=F4JNzMQYBM2N0+mk4ujEJuOCZhGWmz3x+h60yI+MlOL+b/xsXEvhFOXKXL3sLaO7D3L0
	 2VXRatdAn6T7Ey87MBDY+4YI1FkRXmuYE726CcL4J+qbb3OUdjX4y5RE5wSqKnfgJ7hca
	 AlXmqCthhognKd2+4qa8I4/k9fT5xbx2XZJFDKZvlmR0mqStKyhRhcl33uI1MCOCNhd3r
	 Q0ZC1QWOvBdN7fxQPAkGjuQC/Kzf+ADpFyvPbSs0NN7On3d2QYt6M5zixHPO1yZgXpC9h
	 CQyfGIPyyVDO0z+kLaiUj9VSRIdhvMpfzvq8JyV3GQiw0b/+5qQppTWwGIZeuCzA69g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716451;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=fO8QeXvStg/OvId8DJMUDY0DdTVmhBM+wahBamvw0ow=;
	b=KFTxAwkhym/jnDH/WqboLwbZY3lcU/b+U6GYMVdHZJhwIEJOWjISQ2UTmTdWYo5IV1nd
	 053UXsAR5gdFjiOjKoL9l46xi3yrvEObgs+AIQ3bRlu6Nr7OgHz+OyEpGHf2PIemfLyeU
	 VeYKQynn09EgKPSA0kda3+xktICnRxoKpaoNS7PR72R8afr79sShjUEqHI7ydJXcFzrNf
	 hH4THDi5HV3JLwZoXqjZxl09Ucim82IikeLQZ/WoZqooqXp2Zh/Jl0MnaM9OboLKEKqsR
	 IthOMu4QesGEGPXMZX0j52xL/71EMdcN/wTGLYjgD2z28AWtrnd79aEdaBLx1ckwITA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AA7606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 18:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00AA7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 660D342A22;
	Thu, 26 Nov 2026 19:07:22 +0100 (CET)
From: Gabriel Goller <g.goller@proxmox.com>
Date: Thu, 26 Nov 2026 19:07:16 +0100
Subject: [PATCH iproute2-next] bridge: vni: fix typo in error message
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-bridge_vni_fix-v1-1-2e8d5694fee6@proxmox.com>
X-B4-Tracking: v=1; b=H4sIAFN1CGsC/yWM0QqDMBAEf0XuuQETIa39lVLEM1u9PkS5RBHEf
 2/aPs4uMwclqCDRvTpIsUmSORawl4qGqY8jjITC5GrnrXXesEoY0W1RupfshpvrrQkt+xpMRVo
 UZf4FHySLzmuGMxF7puf/Tiu/MeRvlM7zAysq+z2BAAAA
X-Change-ID: 20261126-bridge_vni_fix-b3783d9b60eb
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>, 
 Stephen Hemminger <stephen@networkplumber.org>, 
 Ido Schimmel <idosch@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
 bridge@lists.linux.dev, Gabriel Goller <g.goller@proxmox.com>
X-Mailer: b4 0.17-dev
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1795716441786

Fix "ternminated" -> "terminated".

Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
---
 bridge/vni.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bridge/vni.c b/bridge/vni.c
index b28647fd2f41..aeb62224bf6c 100644
--- a/bridge/vni.c
+++ b/bridge/vni.c
@@ -375,7 +375,7 @@ static int vni_show(int argc, char **argv)
 
 	ret = rtnl_dump_filter(&rth, print_vnifilter_rtm, NULL);
 	if (ret < 0) {
-		fprintf(stderr, "Dump ternminated\n");
+		fprintf(stderr, "Dump terminated\n");
 		exit(1);
 	}
 

---
base-commit: 8055701cb470fdc9e5e9909369bff3f7e24c872e
change-id: 20261126-bridge_vni_fix-b3783d9b60eb

Best regards,
--  
Gabriel Goller <g.goller@proxmox.com>


