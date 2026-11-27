Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791983;
	b=O0XlqicUxqmvyJZBYS/xfekPt6QC+kaVias7wBwiMc0IQPJgZx+mKLkh+KNwUpxJupfq
	 Xz2sp30b5vSeDhiblDz7i2c6F9CtD3lQmFDiInuWgDVvsf74DkRXruT2mOiagDY99Ksg1
	 mZi/Uuvd7GD2/G3nvz7yMr/n7kC13jCamzfm2aZ5ec6CnuiQxj7xsR8oicl6SFQGQEITW
	 zMW1XD7wx8P4MO3pfCBHLAnRXLE52q6BWf0JfDcv4DPTTfUjn3ZZQ8SQQYtmFMhKW8Lzt
	 WdwD9FtqDTpn+KFnTECOoghOZupc40EpqeFIjb6JE6azv5XM+Jfags6w37snsvtSHrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791983;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=zkN0RVaYwRzpvvcbhiGPDlIc1uyxyDLBDaGt4vk1/3Q=;
	b=PLEsMRRWrRCH+RMXqarShFjXpJYEtiiJ3f1eMxGx0MCePNzDPGJ4w+C9oVXwMUa1GrAj
	 pXAhmw1TemBBLdmMdx6KVgZ2WaczpC0nMZB373z0FIUa1EHB5GI4PbgJtczTp0lOIQWOn
	 yURZlOLC1yjT+xf+gei4oE7CEhyvwn+0OkN83AIpShxzjtChxwW7JVeXBOV6bbvaw6hug
	 Bq+xyLKy7CGqP1lrqPdXOs2KHaiEEmp/XdPd+K3TGtwJVO1mCg6n1EN4hm2NVaN6XfBJ5
	 R0cgGOxzFE1pq+EM+0rsal/uTomM+SdMfom0PQTytin7tW2xIteTLgN9sCOyoa/U4Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XZEu6SQZ;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD54606A334
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD54606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XZEu6SQZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795791983; x=1827327983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=526d/MTGyWw5qiW5va0IYFk5j5CxvrAqVKVH7Ns804g=;
  b=XZEu6SQZk8v2HnMhoD2635+gAtXco+pDBVvrRdOikscyeEKuw0mmIT8P
   Ptk2rUVgK87e14echWMj2GXrbT/KRV0lJOGm9VXS7FRlLQBq5LmJcaWyu
   971hg+/Up8m2vKvtRhcUeBNmMrm+mB29NsI7st6gmuxSu2oBDtiNgfYBF
   It/UzfyO2h0SGK9YFfdcHc3tn4epzLEqirzJywd+gOHNpsqnUrW6/hs7o
   GjU9uV8Jawpn9Zzc9TJIuPH27UnXM4mXmWN88TM1ULSlsZGV1Lf93/NZC
   KyEF27L5qFG7Zt20Lk673NqYsZeFRjbk+xrA57VI1X7C4mn/c3ah37YK4
   A==;
X-CSE-ConnectionGUID: K5gCUiHzQjWg6R42dnLOIQ==
X-CSE-MsgGUID: AnUBe+X7QFWsQkMRxBPzGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4666227"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4666227"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:06:22 -0800
X-CSE-ConnectionGUID: Ez/oq4bXRtic/+6Ebj4ETg==
X-CSE-MsgGUID: 11Iy6EhvSLie5Cwn8hhzxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12202974"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2026 07:06:21 -0800
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
Subject: [PATCH v6 net-next 14/15] selftests: drv-net: decouple local link setup from netdevsim
Date: Fri, 27 Nov 2026 16:05:26 +0100
Message-Id: <20261127150527.1122049-15-maciej.fijalkowski@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20261127150527.1122049-1-maciej.fijalkowski@intel.com>
References: <20261127150527.1122049-1-maciej.fijalkowski@intel.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Björn Töpel <bjorn@kernel.org>
Reviewed-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 tools/testing/selftests/drivers/net/hw/tso.py |  8 ++---
 .../selftests/drivers/net/lib/py/env.py       | 29 +++++++++++--------
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/tso.py b/tools/testing/selftests/drivers/net/hw/tso.py
index 1b1d61f53ac4..4307537b49cd 100755
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
index 20affe55750d..ab404f81521f 100644
--- a/tools/testing/selftests/drivers/net/lib/py/env.py
+++ b/tools/testing/selftests/drivers/net/lib/py/env.py
@@ -129,8 +129,8 @@ class NetDrvEpEnv(NetDrvEnvBase):
     """
 
     # Network prefixes used for local tests
-    nsim_v4_pfx = "192.0.2."
-    nsim_v6_pfx = "2001:db8::"
+    sw_v4_pfx = "192.0.2."
+    sw_v6_pfx = "2001:db8::"
 
     def __init__(self, src_path, sw_test=None, queue_count=None):
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

