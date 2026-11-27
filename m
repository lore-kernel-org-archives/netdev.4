Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791981;
	b=Npxsf/JKmE8edSj+JxSRcPGgWvuLJvWtR09ySXbvqO1rx7oznpd5Tgv8nZ6jtRbJYT2F
	 cvA0EC7EWpqRnO2CRpILbAVRADcv1xGnjGJ3ZDvgoUyHLBqcCrHFcFhkjAitVz+FVKakC
	 yFZIEYok1ba4YcgXJW2hrzTgiASFvBYhVhnhmQ+wfka0kbNRGvZNJ0e4d9myNYbsCfzD5
	 JgqNz5HvCeV+hxsp3y+XMNzsSObifHa6zj4dfCiGeGTgE0fSxH5CNpzJaxJ3pfNjH93k4
	 JxQHVooVazzq5TOywWTT8ir/uTsz2a4ztwc6r/qgSe9JI/0OLRO/IM6Bq5V3b+mOBDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791981;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6aRKLaowr1PrxWIWkdA18PMdWnC2+qLPqXpSux2AuNI=;
	b=Kh4O09kEl5EnUpWGCGwi5WMV6tbqrxM33KJ1tzw4KKxkksOxBWPgslEmf2eKm2bvYjFY
	 60mfivQwT13AW5oziZQiBeEgHcp33b7B60f5Jy65SNMyD4ZlKbwrXaectprZ9F08fpPrI
	 AORT5UlJzAG+NGx0YnhMPS8scqwCX0iGtsYYdR+Vi4beZmNiYW+NuaE4/umJ6CWGndTXd
	 EoL/0laXwnOziqxaWwIVQDVGk5tJhg8uPwM9I15RFqSsjnwbtTcUhHGMfPsCv/pyt8kKn
	 ZQOTGkNQ67bkdkyRJJ7UImvE9dBqoLRETfX3coz6+m8uUIoWr9QXwsr0ukh2+zKfQIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="VW7b/8T6";
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5D8606A337
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD5D8606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VW7b/8T6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795791981; x=1827327981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z5cUXSZuasoZc4zeEnExMRmorGHbENMCEQGp9wsadeQ=;
  b=VW7b/8T65AAbVSe93FZ4HnYHXdKADeRnNuC3YhJuneA6JnemvP/tLEfe
   xZkejwyg148a6qK/ODHmM9n89izMfysSO67ZUbtks8J3Jc1brx8oX0vdy
   KKPBzu3yCzYyL7msi4RRc1xAoBOJWDVM+1Mi/J/Z7XkqzaJoEfNEyoOvJ
   UqVRXu6sVWOALvZ4pIR6dhtqMsn8H1x3CkRTvX8a35nVfyd7HtqTQGVp+
   y7ODKjvjgOmQSBA0h/5U4V7JgYA80UzCH8FNbRDwAkI5gnj/ngHkgIeK2
   ykZmEviqjsPOUECEuFsW6pusZ4lzIFsBQrZIX3TuAJMgUdVS8n5Z3bKpM
   Q==;
X-CSE-ConnectionGUID: bQ6GXEIjTh249LP5QZwCFQ==
X-CSE-MsgGUID: h/6pLgUiR6ajtIOQRL1lEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4666207"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4666207"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:06:20 -0800
X-CSE-ConnectionGUID: ib0usJ9zQ+esqo6Zr3+JWg==
X-CSE-MsgGUID: HGDtVk3sTNSco/u05uZ6jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12202946"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2026 07:06:18 -0800
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
Subject: [PATCH v6 net-next 13/15] selftests: drv-net: rename nsim_test to sw_test
Date: Fri, 27 Nov 2026 16:05:25 +0100
Message-Id: <20261127150527.1122049-14-maciej.fijalkowski@intel.com>
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
Content-Transfer-Encoding: 8bit

NetDrvEnv and NetDrvEpEnv take nsim_test to limit a test to the
netdevsim devices that they create without NETIF (True), or to the
NETIF device (False). With a following patch, NetDrvEpEnv can create a
veth pair instead of netdevsim, so rename the argument to sw_test.
require_nsim() keeps nsim_test, as it checks for nsim itself.

No functional change.

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 tools/testing/selftests/drivers/net/hw/csum.py       |  2 +-
 .../drivers/net/hw/devlink_rate_cross_esw.py         |  2 +-
 .../selftests/drivers/net/hw/devlink_rate_tc_bw.py   |  2 +-
 tools/testing/selftests/drivers/net/hw/gro_stats.py  |  2 +-
 .../testing/selftests/drivers/net/hw/ipsec_vxlan.py  |  2 +-
 tools/testing/selftests/drivers/net/hw/irq.py        |  2 +-
 .../selftests/drivers/net/hw/nic_timestamp.py        |  2 +-
 tools/testing/selftests/drivers/net/hw/ntuple.py     |  2 +-
 tools/testing/selftests/drivers/net/hw/pause.py      |  2 +-
 .../selftests/drivers/net/hw/pp_alloc_fail.py        |  2 +-
 tools/testing/selftests/drivers/net/hw/rss_api.py    |  2 +-
 tools/testing/selftests/drivers/net/hw/rss_ctx.py    |  2 +-
 .../selftests/drivers/net/hw/rss_flow_label.py       |  2 +-
 .../selftests/drivers/net/hw/rss_input_xfrm.py       |  2 +-
 tools/testing/selftests/drivers/net/hw/tso.py        |  2 +-
 .../testing/selftests/drivers/net/hw/xsk_reconfig.py |  2 +-
 tools/testing/selftests/drivers/net/lib/py/env.py    | 12 ++++++------
 tools/testing/selftests/drivers/net/perf/devmem.py   |  2 +-
 tools/testing/selftests/drivers/net/perf/iperf.py    |  2 +-
 19 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/csum.py b/tools/testing/selftests/drivers/net/hw/csum.py
index 0e99198f8d39..0deef7812b5e 100755
--- a/tools/testing/selftests/drivers/net/hw/csum.py
+++ b/tools/testing/selftests/drivers/net/hw/csum.py
@@ -85,7 +85,7 @@ def check_nic_features(cfg) -> None:
 
 
 def main() -> None:
-    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEpEnv(__file__, sw_test=False) as cfg:
         check_nic_features(cfg)
 
         cfg.bin_local = cfg.net_lib_dir / "csum"
diff --git a/tools/testing/selftests/drivers/net/hw/devlink_rate_cross_esw.py b/tools/testing/selftests/drivers/net/hw/devlink_rate_cross_esw.py
index 4416f024cb76..91cab142fc3d 100755
--- a/tools/testing/selftests/drivers/net/hw/devlink_rate_cross_esw.py
+++ b/tools/testing/selftests/drivers/net/hw/devlink_rate_cross_esw.py
@@ -278,7 +278,7 @@ def test_tx_rates_on_cross_esw(cfg):
 def main() -> None:
     """Main function."""
 
-    with NetDrvEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEnv(__file__, sw_test=False) as cfg:
         cfg.devnl = DevlinkFamily()
 
         ksft_run(
diff --git a/tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py b/tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py
index 38d712755257..4fc02259ff35 100755
--- a/tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py
+++ b/tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py
@@ -416,7 +416,7 @@ def main() -> None:
     """
     Main entry point for running the test cases.
     """
-    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEpEnv(__file__, sw_test=False) as cfg:
         cfg.devnl = DevlinkFamily()
 
         cfg.pci = os.path.basename(
diff --git a/tools/testing/selftests/drivers/net/hw/gro_stats.py b/tools/testing/selftests/drivers/net/hw/gro_stats.py
index 70e76e3888bd..32b5c766741f 100755
--- a/tools/testing/selftests/drivers/net/hw/gro_stats.py
+++ b/tools/testing/selftests/drivers/net/hw/gro_stats.py
@@ -292,7 +292,7 @@ def test_gro_order(cfg, num_flows):
 def main() -> None:
     """ Ksft boiler plate main """
 
-    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEpEnv(__file__, sw_test=False) as cfg:
         cfg.netnl = NetdevFamily()
         ksft_run([test_gro_stats_single,
                   test_gro_stats_full,
diff --git a/tools/testing/selftests/drivers/net/hw/ipsec_vxlan.py b/tools/testing/selftests/drivers/net/hw/ipsec_vxlan.py
index 0740a4d85240..88d79e9fd0ec 100755
--- a/tools/testing/selftests/drivers/net/hw/ipsec_vxlan.py
+++ b/tools/testing/selftests/drivers/net/hw/ipsec_vxlan.py
@@ -195,7 +195,7 @@ def test_vxlan_ipsec_crypto_offload(cfg, outer_ipver, inner_ipver):
 
 def main():
     """Runs VXLAN+IPsec crypto-offload GSO selftest."""
-    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEpEnv(__file__, sw_test=False) as cfg:
         ksft_run([test_vxlan_ipsec_crypto_offload], args=(cfg,))
     ksft_exit()
 
diff --git a/tools/testing/selftests/drivers/net/hw/irq.py b/tools/testing/selftests/drivers/net/hw/irq.py
index 0699d6a8b4e2..364f270081c1 100755
--- a/tools/testing/selftests/drivers/net/hw/irq.py
+++ b/tools/testing/selftests/drivers/net/hw/irq.py
@@ -85,7 +85,7 @@ def check_down(cfg) -> None:
 
 
 def main() -> None:
-    with NetDrvEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEnv(__file__, sw_test=False) as cfg:
         cfg.ethnl = EthtoolFamily()
         cfg.netnl = NetdevFamily()
 
diff --git a/tools/testing/selftests/drivers/net/hw/nic_timestamp.py b/tools/testing/selftests/drivers/net/hw/nic_timestamp.py
index c632b41e7a23..7e512b62ffbc 100755
--- a/tools/testing/selftests/drivers/net/hw/nic_timestamp.py
+++ b/tools/testing/selftests/drivers/net/hw/nic_timestamp.py
@@ -213,7 +213,7 @@ def test_hwtstamp_rx_ioctl(cfg):
 def main() -> None:
     """ Ksft boiler plate main """
 
-    with NetDrvEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEnv(__file__, sw_test=False) as cfg:
         cfg.ethnl = EthtoolFamily()
         ksft_run([test_hwtstamp_tx_ioctl, test_hwtstamp_tx_netlink,
                   test_hwtstamp_rx_ioctl, test_hwtstamp_rx_netlink],
diff --git a/tools/testing/selftests/drivers/net/hw/ntuple.py b/tools/testing/selftests/drivers/net/hw/ntuple.py
index ef4604bfa8ef..5f9fa3b61bd9 100755
--- a/tools/testing/selftests/drivers/net/hw/ntuple.py
+++ b/tools/testing/selftests/drivers/net/hw/ntuple.py
@@ -154,7 +154,7 @@ def queue(cfg, ipver, proto, fields):
 def main() -> None:
     """Ksft boilerplate main."""
 
-    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEpEnv(__file__, sw_test=False) as cfg:
         cfg.ethnl = EthtoolFamily()
         cfg.netdevnl = NetdevFamily()
         ksft_run([queue], args=(cfg,))
diff --git a/tools/testing/selftests/drivers/net/hw/pause.py b/tools/testing/selftests/drivers/net/hw/pause.py
index c3398c7452e0..a18d3d7f2653 100755
--- a/tools/testing/selftests/drivers/net/hw/pause.py
+++ b/tools/testing/selftests/drivers/net/hw/pause.py
@@ -932,7 +932,7 @@ def pause_autoneg_link_autoneg(cfg):
 
 def main():
     """ Entry point """
-    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEpEnv(__file__, sw_test=False) as cfg:
         ksft_run([pause_test_support,
                   pause_advertising_test,
                   pause_aneg_resolution,
diff --git a/tools/testing/selftests/drivers/net/hw/pp_alloc_fail.py b/tools/testing/selftests/drivers/net/hw/pp_alloc_fail.py
index 2a51b60df8a1..db37538c0168 100755
--- a/tools/testing/selftests/drivers/net/hw/pp_alloc_fail.py
+++ b/tools/testing/selftests/drivers/net/hw/pp_alloc_fail.py
@@ -134,7 +134,7 @@ def test_pp_alloc(cfg, netdevnl):
 def main() -> None:
     """ Ksft boiler plate main """
     netdevnl = NetdevFamily()
-    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEpEnv(__file__, sw_test=False) as cfg:
 
         ksft_run([test_pp_alloc], args=(cfg, netdevnl, ))
     ksft_exit()
diff --git a/tools/testing/selftests/drivers/net/hw/rss_api.py b/tools/testing/selftests/drivers/net/hw/rss_api.py
index 19847f3d4a00..e7f79179d8d5 100755
--- a/tools/testing/selftests/drivers/net/hw/rss_api.py
+++ b/tools/testing/selftests/drivers/net/hw/rss_api.py
@@ -466,7 +466,7 @@ def test_rss_ctx_ntf(cfg):
 def main() -> None:
     """ Ksft boiler plate main """
 
-    with NetDrvEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEnv(__file__, sw_test=False) as cfg:
         cfg.ethnl = EthtoolFamily()
         ksft_run(globs=globals(), case_pfx={"test_"}, args=(cfg, ))
     ksft_exit()
diff --git a/tools/testing/selftests/drivers/net/hw/rss_ctx.py b/tools/testing/selftests/drivers/net/hw/rss_ctx.py
index 5b25fa89c629..dbd8893c8a73 100755
--- a/tools/testing/selftests/drivers/net/hw/rss_ctx.py
+++ b/tools/testing/selftests/drivers/net/hw/rss_ctx.py
@@ -1015,7 +1015,7 @@ def test_rss_context_persist_ifdown_and_create(cfg):
 
 
 def main() -> None:
-    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEpEnv(__file__, sw_test=False) as cfg:
         cfg.context_cnt = None
         cfg.ethnl = EthtoolFamily()
         cfg.netdevnl = NetdevFamily()
diff --git a/tools/testing/selftests/drivers/net/hw/rss_flow_label.py b/tools/testing/selftests/drivers/net/hw/rss_flow_label.py
index 7dc80070884a..39baf07f3842 100755
--- a/tools/testing/selftests/drivers/net/hw/rss_flow_label.py
+++ b/tools/testing/selftests/drivers/net/hw/rss_flow_label.py
@@ -161,7 +161,7 @@ def test_rss_flow_label_6only(cfg):
 
 
 def main() -> None:
-    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEpEnv(__file__, sw_test=False) as cfg:
         ksft_run([test_rss_flow_label,
                   test_rss_flow_label_6only],
                  args=(cfg, ))
diff --git a/tools/testing/selftests/drivers/net/hw/rss_input_xfrm.py b/tools/testing/selftests/drivers/net/hw/rss_input_xfrm.py
index 503f1a2a2872..1b8ee94ac553 100755
--- a/tools/testing/selftests/drivers/net/hw/rss_input_xfrm.py
+++ b/tools/testing/selftests/drivers/net/hw/rss_input_xfrm.py
@@ -111,7 +111,7 @@ def test_rss_input_xfrm_ipv6(cfg):
 
 
 def main() -> None:
-    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEpEnv(__file__, sw_test=False) as cfg:
         cfg.ethnl = EthtoolFamily()
         cfg.netdevnl = NetdevFamily()
 
diff --git a/tools/testing/selftests/drivers/net/hw/tso.py b/tools/testing/selftests/drivers/net/hw/tso.py
index 176ddf97fabb..1b1d61f53ac4 100755
--- a/tools/testing/selftests/drivers/net/hw/tso.py
+++ b/tools/testing/selftests/drivers/net/hw/tso.py
@@ -379,7 +379,7 @@ def query_nic_features(cfg) -> None:
 
 
 def main() -> None:
-    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEpEnv(__file__, sw_test=False) as cfg:
         cfg.ethnl = EthtoolFamily()
         cfg.netnl = NetdevFamily()
 
diff --git a/tools/testing/selftests/drivers/net/hw/xsk_reconfig.py b/tools/testing/selftests/drivers/net/hw/xsk_reconfig.py
index d19d1d518208..f80beb3ce098 100755
--- a/tools/testing/selftests/drivers/net/hw/xsk_reconfig.py
+++ b/tools/testing/selftests/drivers/net/hw/xsk_reconfig.py
@@ -51,7 +51,7 @@ def check_rx_resize(cfg):
         ethtool(f"-G %s rx %d" % (cfg.ifname, rx_ring))
 
 def main():
-    with NetDrvEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEnv(__file__, sw_test=False) as cfg:
         ksft_run([check_xdp_bind, check_rx_resize],
                  args=(cfg, ))
     ksft_exit()
diff --git a/tools/testing/selftests/drivers/net/lib/py/env.py b/tools/testing/selftests/drivers/net/lib/py/env.py
index 6262080a8bf4..20affe55750d 100644
--- a/tools/testing/selftests/drivers/net/lib/py/env.py
+++ b/tools/testing/selftests/drivers/net/lib/py/env.py
@@ -93,18 +93,18 @@ class NetDrvEnv(NetDrvEnvBase):
     """
     Class for a single NIC / host env, with no remote end
     """
-    def __init__(self, src_path, nsim_test=None, **kwargs):
+    def __init__(self, src_path, sw_test=None, **kwargs):
         super().__init__(src_path)
 
         self._ns = None
 
         if 'NETIF' in self.env:
-            if nsim_test is True:
+            if sw_test is True:
                 raise KsftXfailEx("Test only works on netdevsim")
 
             self.dev = ip("-d link show dev " + self.env['NETIF'], json=True)[0]
         else:
-            if nsim_test is False:
+            if sw_test is False:
                 raise KsftXfailEx("Test does not work on netdevsim")
 
             self._ns = NetdevSimDev(**kwargs)
@@ -132,7 +132,7 @@ class NetDrvEpEnv(NetDrvEnvBase):
     nsim_v4_pfx = "192.0.2."
     nsim_v6_pfx = "2001:db8::"
 
-    def __init__(self, src_path, nsim_test=None, queue_count=None):
+    def __init__(self, src_path, sw_test=None, queue_count=None):
         super().__init__(src_path)
 
         self._stats_settle_time = None
@@ -149,7 +149,7 @@ class NetDrvEpEnv(NetDrvEnvBase):
         self.remote_addr_v = { "4": None, "6": None }
 
         if "NETIF" in self.env:
-            if nsim_test is True:
+            if sw_test is True:
                 raise KsftXfailEx("Test only works on netdevsim")
             self._check_env()
 
@@ -162,7 +162,7 @@ class NetDrvEpEnv(NetDrvEnvBase):
             kind = self.env["REMOTE_TYPE"]
             args = self.env["REMOTE_ARGS"]
         else:
-            if nsim_test is False:
+            if sw_test is False:
                 raise KsftXfailEx("Test does not work on netdevsim")
 
             self.create_local()
diff --git a/tools/testing/selftests/drivers/net/perf/devmem.py b/tools/testing/selftests/drivers/net/perf/devmem.py
index 4c1fb9b51fff..6014358e291e 100755
--- a/tools/testing/selftests/drivers/net/perf/devmem.py
+++ b/tools/testing/selftests/drivers/net/perf/devmem.py
@@ -87,7 +87,7 @@ def kperf(cfg) -> None:
 
 def main() -> None:
     """Run the devmem performance test."""
-    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEpEnv(__file__, sw_test=False) as cfg:
         ksft_run([kperf], args=(cfg,))
     ksft_exit()
 
diff --git a/tools/testing/selftests/drivers/net/perf/iperf.py b/tools/testing/selftests/drivers/net/perf/iperf.py
index 5b6f0bce2a03..53afe0e70851 100755
--- a/tools/testing/selftests/drivers/net/perf/iperf.py
+++ b/tools/testing/selftests/drivers/net/perf/iperf.py
@@ -14,7 +14,7 @@ def tcp(cfg):
 
 def main():
     """Run the iperf performance test."""
-    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+    with NetDrvEpEnv(__file__, sw_test=False) as cfg:
         ksft_run([tcp], args=(cfg,))
     ksft_exit()
 
-- 
2.43.0

