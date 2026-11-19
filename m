Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106834;
	b=Ko+0T+/s+hTeP0dl2b8qa0YyCiYh7CzUTBz9YvaeIFmb9TvE1daoE9QbukL2aeuYPSPr
	 3Zpa6mUxi37WZb2p2WZrMwpeb9xvhR4tzGUpc84jUr1QO3A8mmTa5nnbtjVL/TSKDRTvZ
	 ODC14ZUTWdfQQY6dWf4QHvN7EcVdlcY53KdRpH6iGQtg9d/BKB7l/fRyUdydI4nm2u4gi
	 2bC6iAUy8joBQmNcZK043+VNmjRk+cfhYSQw1Et3zTdYPOAs6A/jvdOzitkG35RCY87VW
	 AWoQjMVHwxlWk+pqx2cNTFzVI+igN3WMGmnz4rRUuPvJfWgjtZAOdis5IMSiFmmNClg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106834;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OzK0Qw69VD6VVItUJWQXf3fntmKabsBKQGsA79fcktA=;
	b=377UxK6wAzdvmkPoWRXEDShCoJ6cgshpM/Ovc6iUIxvfaD5ztOkphGquPnC6/BE5UHZo
	 JDctyOwCeM3BBe5c2vfytlihyvJHB9QgoqLLjoB0egVYWSDcHAPNeR5B3eLHdaHa4rqOt
	 /YLp9ufjSGQoENfDzeb7645t0mW4NY24vWdv/clga0l6gtAHLeazfKzXa+MKdFQkD+V/0
	 WnmOIzQ7wFrPdD/oplQ3s/ALxkSsUcMFA1qjRRpQzHrf4nZNp1thylYI0F4AO6PVK8V5W
	 uO4WYMfDPw5XjYYn69A1W4XhxGKzeHXzeNJnFs9oYlU9DwuqrQZVYf/h8B8jiTek1wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jz5Lq0p5;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBDA60A2630
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBBDA60A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jz5Lq0p5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795106832; x=1826642832;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yRlxMcuCa45dHR1dcrRRDdSdoHRq9zBvoq044byHdxk=;
  b=Jz5Lq0p5EoRBWyqnBA+E8975jqUjCjUO1HFZqtC1iXJz8/bBG3v+l5WU
   MuFveIQ+fsBAFxIxRbLBKHag1IH0pjHAoPgBKSMLAW93bkChV0+vkeYhe
   vlTaDsN6UgQ4qddwDuug1w30+Htis9aoPTlcdd2ZxgUPJGLS+7EmSQ3xg
   mss/ARIHUlsyKzwOC+Y6EvfI9uV4narkFcAqmL/rlZlpDJAwN9chDGgzA
   r2RwQsMdQi91KlDZTkvZN+NuMrhjTaec2d7MivVQnJSKvtq2cN4Mj0cCI
   s1m7x3c1+YdONMW36ekBUFWtFD3LoP8FwBQ+imc87jTM8MFy9E4ezHsWT
   w==;
X-CSE-ConnectionGUID: ZYxhH5WZQR2c2tv+5yglEA==
X-CSE-MsgGUID: DigFavRwQzmqU+y6Qz5DSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3991209"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3991209"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:47:12 -0800
X-CSE-ConnectionGUID: 0KQs/sVRTjyPkpRFq+XBKw==
X-CSE-MsgGUID: v+Lrbo7iRfyOq8u7Lq1KPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10843402"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by fmviesa007.fm.intel.com with ESMTP; 19 Nov 2026 08:47:10 -0800
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: netdev@vger.kernel.org
Cc: magnus.karlsson@intel.com,
	stfomichev@gmail.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	tushar.vyavahare@intel.com,
	kerneljasonxing@gmail.com,
	bjorn@kernel.org,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: [PATCH v5 net-next 11/13] selftests: drv-net: decouple local link setup from netdevsim
Date: Thu, 19 Nov 2026 17:46:34 +0100
Message-Id: <20261119164636.1071385-12-maciej.fijalkowski@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
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

Without NETIF, NetDrvEpEnv addresses its pair of netdevsim devices from
nsim_v4_pfx and nsim_v6_pfx and brings them up in create_local(). A
following patch lets the env create a veth pair instead, which needs the
same addresses and setup.

Rename the prefixes to sw_v4_pfx and sw_v6_pfx, as they serve any
software interface pair, and update tso.py, which builds its tunnel
addresses from them. Move the address and link setup out of
create_local() into _setup_sw_ifaces(), which takes the names of the
local interface and its peer.

No functional change.

Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 tools/testing/selftests/drivers/net/hw/tso.py |  8 ++---
 .../selftests/drivers/net/lib/py/env.py       | 29 +++++++++++--------
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/tso.py b/tools/testing/selftests/drivers/net/hw/tso.py
index 176ddf97fabb..5fd6d3d2ec73 100755
--- a/tools/testing/selftests/drivers/net/hw/tso.py
+++ b/tools/testing/selftests/drivers/net/hw/tso.py
@@ -245,10 +245,10 @@ def run_big_tcp_stream(cfg, ipver, remote_v4, remote_v6):
 
 
 def build_tunnel(cfg, outer_ipver, tun_info):
-    local_v4  = NetDrvEpEnv.nsim_v4_pfx + "1"
-    local_v6  = NetDrvEpEnv.nsim_v6_pfx + "1"
-    remote_v4 = NetDrvEpEnv.nsim_v4_pfx + "2"
-    remote_v6 = NetDrvEpEnv.nsim_v6_pfx + "2"
+    local_v4  = NetDrvEpEnv.sw_v4_pfx + "1"
+    local_v6  = NetDrvEpEnv.sw_v6_pfx + "1"
+    remote_v4 = NetDrvEpEnv.sw_v4_pfx + "2"
+    remote_v6 = NetDrvEpEnv.sw_v6_pfx + "2"
 
     local_addr  = cfg.addr_v[outer_ipver]
     remote_addr = cfg.remote_addr_v[outer_ipver]
diff --git a/tools/testing/selftests/drivers/net/lib/py/env.py b/tools/testing/selftests/drivers/net/lib/py/env.py
index 6262080a8bf4..c1d58bef754f 100644
--- a/tools/testing/selftests/drivers/net/lib/py/env.py
+++ b/tools/testing/selftests/drivers/net/lib/py/env.py
@@ -129,8 +129,8 @@ class NetDrvEpEnv(NetDrvEnvBase):
     """
 
     # Network prefixes used for local tests
-    nsim_v4_pfx = "192.0.2."
-    nsim_v6_pfx = "2001:db8::"
+    sw_v4_pfx = "192.0.2."
+    sw_v6_pfx = "2001:db8::"
 
     def __init__(self, src_path, nsim_test=None, queue_count=None):
         super().__init__(src_path)
@@ -169,10 +169,10 @@ class NetDrvEpEnv(NetDrvEnvBase):
 
             self.dev = self._ns.nsims[0].dev
 
-            self.addr_v["4"] = self.nsim_v4_pfx + "1"
-            self.addr_v["6"] = self.nsim_v6_pfx + "1"
-            self.remote_addr_v["4"] = self.nsim_v4_pfx + "2"
-            self.remote_addr_v["6"] = self.nsim_v6_pfx + "2"
+            self.addr_v["4"] = self.sw_v4_pfx + "1"
+            self.addr_v["6"] = self.sw_v6_pfx + "1"
+            self.remote_addr_v["4"] = self.sw_v4_pfx + "2"
+            self.remote_addr_v["6"] = self.sw_v6_pfx + "2"
             kind = "netns"
             args = self._netns.name
 
@@ -208,13 +208,18 @@ class NetDrvEpEnv(NetDrvEnvBase):
             NetdevSimDev.ctrl_write('link_device',
                                     f'{nsfd0.fileno()}:{ifi0} {nsfd1.fileno()}:{ifi1}')
 
-        ip(f"   addr add dev {self._ns.nsims[0].ifname} {self.nsim_v4_pfx}1/24")
-        ip(f"-6 addr add dev {self._ns.nsims[0].ifname} {self.nsim_v6_pfx}1/64 nodad")
-        ip(f"   link set dev {self._ns.nsims[0].ifname} up")
+        self._setup_sw_ifaces(self._ns.nsims[0].ifname,
+                              self._ns_peer.nsims[0].ifname)
 
-        ip(f"   addr add dev {self._ns_peer.nsims[0].ifname} {self.nsim_v4_pfx}2/24", ns=self._netns)
-        ip(f"-6 addr add dev {self._ns_peer.nsims[0].ifname} {self.nsim_v6_pfx}2/64 nodad", ns=self._netns)
-        ip(f"   link set dev {self._ns_peer.nsims[0].ifname} up", ns=self._netns)
+    def _setup_sw_ifaces(self, ifname, peer_ifname):
+        """Address and bring up a local interface and its peer in _netns."""
+        ip(f"   addr add dev {ifname} {self.sw_v4_pfx}1/24")
+        ip(f"-6 addr add dev {ifname} {self.sw_v6_pfx}1/64 nodad")
+        ip(f"   link set dev {ifname} up")
+
+        ip(f"   addr add dev {peer_ifname} {self.sw_v4_pfx}2/24", ns=self._netns)
+        ip(f"-6 addr add dev {peer_ifname} {self.sw_v6_pfx}2/64 nodad", ns=self._netns)
+        ip(f"   link set dev {peer_ifname} up", ns=self._netns)
 
     def _check_env(self):
         vars_needed = [
-- 
2.43.0

