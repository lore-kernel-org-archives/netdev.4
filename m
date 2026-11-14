Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694546;
	b=B4VblYlBm0mXiZofB2ZuKOwDZxHZgjbi+as14PMibEWO/RZBkvBaF9y5AFcFo3uXl+HO
	 oPk2kEtMRTRq8F4qqKomYZVV1OGQ600BdDi66Kraaf4cJ116XqiUnxBOYboxB6DOHJ7bl
	 3dLbGvhnPoMTaGjoQ3hbt14nIvytyecVWOqmxFq4id1VOKbAGyLiYEqG7i/MHxiiBYoAT
	 mGlqkoD3aBGgUbU4tm6nujGNl6+Y2xN/ILRgx8dIXm+Wc5hGFE1+rncMkhucCbnBZfejx
	 Z0fbN1f0rbl+JrZu1EGcHx8yiwYzX8F5ggCnwctrmeRb4paysIsy1JyuSW80WkKLFZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=psCKisTbpJp1WRpTRFiCgMrs5Tc48KteBL0XoQIn2kk=;
	b=p9Ixl3mbwdJsrxtW15cJe0wdBwYPzwJkEb7QeYlcSFoC1tHLiJgZ5q/MUiItk8X5nHNd
	 xMH9K0pUWnmjjr+idLAUd+okt+hIKY/cNAjwt3RcEb6Sb1aHB1jRffQk6Go6xlQl9c2tl
	 tTCzNy+mda2m6pagmziZYvBlIzZnj9OUQV/5lsif/6fIM9AHuPmY4GVOfd5GCzLGltkb+
	 wNnOwoC1JQWZdFFGJAzEyNwYNYSRWPN+a9UKjY8gBuWMYwsE/Io47jS+xNihcTF/kUEII
	 SHYwmKQOjusWkGIyg5Mqkfa5RXNt+EEyJqnkUypXTA8QiaL8HEJLtkpGc0o7WZChY7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H4X+qHoj;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E371060A260F
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 22:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E371060A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H4X+qHoj
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49465892f7bso1881203f8f.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 14:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694544; x=1795299344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psCKisTbpJp1WRpTRFiCgMrs5Tc48KteBL0XoQIn2kk=;
        b=H4X+qHojpx1LYBhdEpFy045MEYW1a0DsOUuqj9IZciuzX2vxbU4HMPTPB/vI/QGdNQ
         SUKKBY3GJ9lznikm2/qJVPbjf49w3pMTL/Px21cLCmvajf4PuwizmPJ/3AKfLyaAdWI1
         AeSWdVdKtIOrPHAURT+zj5mDR5z8qLFRop6mixyWs28i+GYco4APZiDd1O2olKySZ3/V
         hofz0o/vHP+oNT1OEILHosZYGRBibYJHy4Jxb39zExjFqFg7uk9enr4qPN85qNtQi6Mw
         DtUO5su9K9uxFQOEI8rJ+uVj/XiS+s+xPtEtMxHqeMwIhF/0hb3sua2zXeSoh5gvUYx+
         cUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694544; x=1795299344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=psCKisTbpJp1WRpTRFiCgMrs5Tc48KteBL0XoQIn2kk=;
        b=c/8CVL/LPvKpWyh2J2GEozujNtXtYeBXUD1cPR4u4A74HuRCNOZhm3K/2FbdrUuh1N
         jEQ/lQeHsl0kQbQIg5A7NeJz6U2ejPSSQF1Cs4KfIGuuPF4QzMKuGApOxRvNY+2/twu3
         noHtSC774x7C0biLJ99OKXMdcHKjl1UbK7QPXxJ8Egv/D+E645i39QMdRWcDePwH6PIx
         rfrQxfcEtkgIyDwIBqBFL6c+yjC1LnsFWeWWLuhN6NbmaBn3MSsKPpZRkPNMPF4q8N0M
         hl8Tbi7sMtODeYWSeEgz097vJS4mNbVZlSvZdc5NKBWdb6K+uW4/pmpbs1XiA6GNKIQl
         9uHw==
X-Gm-Message-State: APuU4Z/XjrI/S/SGmfpgRE3rZqrR9EyzqmdV5jjqxiDUhhWjUATeYwRM
	DwFMGquTYzJQ3YLsr9LdedDPvZKZcVtsQYSDsYuzbvVIf3sh5AZgH6AwvEo3NS+p4+4=
X-Gm-Gg: AYBFou3JayEv3dwWLaijgTygYvwc1ePw3U5/IZW5+BmPyf9Bj1Ng+eip1G6CbQjHRPD
	vl3myvM/SQ8ULdfzI3wM0WvxXtUBiJrQryWzie/WiFHQTgRzF4nt/ZNmZWQRUuaf6wrZDafWMWu
	yF4eBYSJspNOlTMIyGezBOwIhCzWxwtuUH2YVQJk+rKLIbz3zW4vBuFGYklr9heVfJnccrhDgVr
	w8kT+kufu+xrL/wocD+p7uqmC1njHS+vICZde3ZPBkCwy0rNVuv3okD77jiyqElsDxgh8somEfA
	9vCNQSfPcD4vzK5GcOr4NRdlpCSW0kTU4fhV/YqEcXI3VhJ3UK9J+l+utu0fs9izUBAx/kfceCC
	jdwOJKH6onwvCq1LmPPvV5AaDtTYgLtrmnNIXxlSEwRK5u5gis/3F/oMa01llmfdLCjTE3osgFH
	mxvalv3BybvatjbThg6wM7EP063iB6Wr3b7MuUQF8CiAp6nk/BNFDUNa/vvKlI4xApJysw0DX4v
	06JQW/2ymgY/PD6mjmBGCd/EJPl/Eo0nckqCjtNHl6vSRCNMx+iHezm/Qaeuu193KMOvfDNNuM8
	teesnLDXLAJMFZLypYoMx2DQ
X-Received: by 2002:a05:6000:24c8:b0:49c:9e8a:31b9 with SMTP id ffacd0b85a97d-49c9e8a3318mr13880612f8f.9.1794694544235;
        Sat, 14 Nov 2026 14:15:44 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:43 -0800 (PST)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	kuniyu@google.com,
	petrm@nvidia.com,
	aroulin@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v5 4/8] vxlan: vnifilter: account per-VNI memory to memcg
Date: Sun, 15 Nov 2026 01:14:08 +0300
Message-ID: <20261114221412.255825-5-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114221412.255825-1-alishmery18@gmail.com>
References: <20261114221412.255825-1-alishmery18@gmail.com>
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

vxlan_vni_alloc() allocates a struct vxlan_vni_node and a per-CPU stats
block for every VNI, both with plain GFP_KERNEL, so neither is charged
to the cgroup of the process that created the VNI. A netdevice's own
struct and its Tx/Rx queues are already GFP_KERNEL_ACCOUNT in
alloc_netdev_mqs() (commit c948f51c1654 ("memcg: enable accounting for
net_device and Tx/Rx queues")), so these per-VNI allocations are an
unaccounted part of a device that a cgroup can grow one VNI at a time.

Charge both to the caller's cgroup with GFP_KERNEL_ACCOUNT in
vxlan_vni_alloc(). __GFP_ACCOUNT only charges an allocation made from a
task in a non-root memcg, so the sole caller, which already handles a
NULL return, is unaffected outside a memcg.

The charge lands in the caller's memcg: adding VNIs from inside one
moves each node into the accounted slab and raises the cgroup's per-CPU
memory. This covers the node and its stats only; a VNI carrying a group
or remote also installs a default FDB entry, whose allocations are not
charged here; "vxlan: vnifilter: account the default FDB entry to memcg"
later in this series accounts them.

Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v5: name the FDB accounting patch by subject; after the reordering it
is no longer the next patch.
v4: reworded to cover the node and stats only; the c948f51c1654
reference narrowed to net_device and its Tx/Rx queues; rebased.

 drivers/net/vxlan/vxlan_vnifilter.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 127ed5b2a2eb..07aa641f16e8 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -826,10 +826,11 @@ static struct vxlan_vni_node *vxlan_vni_alloc(struct vxlan_dev *vxlan,
 {
 	struct vxlan_vni_node *vninode;
 
-	vninode = kzalloc_obj(*vninode);
+	vninode = kzalloc_obj(*vninode, GFP_KERNEL_ACCOUNT);
 	if (!vninode)
 		return NULL;
-	vninode->stats = netdev_alloc_pcpu_stats(struct vxlan_vni_stats_pcpu);
+	vninode->stats = __netdev_alloc_pcpu_stats(struct vxlan_vni_stats_pcpu,
+						   GFP_KERNEL_ACCOUNT);
 	if (!vninode->stats) {
 		kfree(vninode);
 		return NULL;
-- 
2.53.0

