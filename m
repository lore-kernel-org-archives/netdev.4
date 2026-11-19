Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082863;
	b=En9TQ6qjSboh2ADNPEdahprp0y3FmbSOVZRfZ3FekJrGoA+iktrYcqyEPoY34kdQpuLu
	 c+lCACaa+HkJQ/4ENsTU24AvzxmxpI+rij304AXEZpKiNNarDx1jbNQtfko9s7sfSp0j/
	 oYqGWasSZ818W4Ej/AAxyydB5P7O9Mwr7QaSBbDckHH5j5nq5cBPGgpFmqcaFwILwUZBj
	 YK6ewHdRcTIxgYxVr8tKgFOX8kMiA+6MMWSyy52CrLj4WaivRhYepgYyWVbpaYzkr1Y/D
	 O9UFfIqFhiajD2iRpZMRXtm7TfJ4ADvPM/zLH+MCq1u+uktopSoiYkNzGB7cETuRX6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pe2OAxVfJeDdgzeyZuJJIAnLstTOMv8OIfQzeyFbz5U=;
	b=ObSWqPCUwHMp9T9/5viJITkAZAeaQP7oUBwoBHmJiqOSJljDCKsLSi9zlOpmv3me+te8
	 HszhVxSOW9GcMRCSTBzENoLAD6Ax+u504DRySFp3BOkjvtGCYdOk8L7n6OXP10w7Men8D
	 SrQ6aSXTCDLuicc1gnxZY4MxCEG+PGqFAh825QvgOO6NJE7tP0Nr+laCjmJOrByLvsz5m
	 dOWpWbkh7Fp7KURSJ7eh7se69+H4wRsbXPfoNYUT6s83pMnBahNGamTKIOLWqFiUr1CS4
	 N4ToN2Un3aKi4kMHAySJir/6fLaj78GGM9ah1nYZtShIeDFeon2KEg4wRLPgieP4VMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=HI1mrwks;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7CF60A2600
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A7CF60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=HI1mrwks
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8199E3F698
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795082855;
	bh=pe2OAxVfJeDdgzeyZuJJIAnLstTOMv8OIfQzeyFbz5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=HI1mrwksu4l95HbZn85Nf9YQSTmNIKuQi7C65u0qucWPTDNszVOCyOdy+u8Y9WVtK
	 pvztlBt/8r9OSewmyG4UDQVoCr9vyvQIHvqbysrVr+lOvRELOvijuzAdVqz1cVmOXz
	 ryOaa6lOnGz+2XrATQgmCIVFhXcIqG5gSe31z+FQgYL0PpVeGxmUngeYkZyPVHbuHY
	 xeJkSNvZNbfYY0ff12hrR+e6yZHWO0EiXAJ6CFR85lt2uOWb/NCxpgiI4SYmj+IFbP
	 fq0MgNGsG4B+/TI8h5zHbkGYAYp9OjHTB8jmS7hjHgelLahu8evrwg6ityQvxNKQ+G
	 wAI/8WXY6eXr99AAPdzY9nNIPxLNZ3elpw9ywHIrCRo3GxwG4yqEP0ZZvfL+nE/DKW
	 vFvl49YMQLW7VGw9Ix0LSCdhrlsuQNW+aWIAR8iCFcQX2s02pZqOIDuABq1icAloeR
	 pszGdSLN0RZetjH42GGrG8A6KcssF7O1EP+w09Lq5ZSt98CunkOcUknZSP/+h6QJTS
	 PXlmfW/RUWp/INeC/AmlyOPsv73OvYA+MPEhRaTloGq0gESrQ1awM1L6iV8k16nWQt
	 5lGH+OMdOCv6OF8v25Xfew41FK7eGusmFusnTTN0mRlmyNgpdQSo7dHTth3N1YVdib
	 EY3ll88JINmZWJTZHeM84miA=
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b5b49cabso1736789c88.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:07:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082854; x=1795687654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pe2OAxVfJeDdgzeyZuJJIAnLstTOMv8OIfQzeyFbz5U=;
        b=gwiqhfEHhBhvDBzg3eUOFwaJtNpwgVAMErfsOrwLgIoJ7xev2T9ZGDAcTPAKw8FDAe
         d3G3AZtWJLb8GHlDVDEz/2LPAsdGPg2xa7xqG9wkQbyQYu5YW2iIbi9VTeCGnSgjity8
         +N1ROiT3tEkjdb/zWcnd/YSHaII3cm9SEstGlhDEUORcaVT8pGAA6Y8WsRDdKOnXEROi
         9Ua+ptA1XzLfNUhZS9FXtLpogu3tHwIE4ZCwrBg2ksnlCRJiwrC3YnG6F3k+dirC32XB
         JxaHnx/cOwbSmxccCGA5w+lGCdjWy4jp6BT47RgzVgosRRG082J5UB4pYJcSE8yPfIMw
         c9jw==
X-Gm-Message-State: APuU4Z905hpB0QKQYFw54ZM+DhG9sLxPOAk8JeMCrydSgpknqm48x8V7
	wT5WbwC80PWk7U5bJa/H4pjWVqkuuMM8ugwPz++tiK36qbTaykUdAinAJaMH915H1KHFQ7VHU9a
	Z2w+c9NKcOEd2dxHVYeZ5ATz2lVVlkf1KKlNFxsR7Rj0iS9ujU+VqUSuGQAnL2aifaqs3HhNTmA
	==
X-Gm-Gg: AYBFou0o1IHRNhhpXFhY//2Dt0BBJuMVU16n8Rm2sGDJo7NCeE7tBFLyQe2YGV5jlmT
	/ijz2O52aadD59Ic5y8Dom9aSNI3UhPblDvC9FbT8RWTxj3iIXrJXwznnJH6NLdqbplnRlDnG9s
	ChgRWuXIgq3WqWv4zu7/du8LjUk1Yl4uN+tHinbwELZulUpIq/kSmsZgmNSal/U/5MZOaf1Ab8P
	1Jy66ufqnPejw8Enc37U9tIsHLQOP/GdxNTG9gvpLqOyu1C4W6wCBWLxZ2Ad8hy/F6yL0QdUuhT
	HnpUQTS/QeNapOn9EXYE+cZUMoEjk3zRVgpctGL9QXzuhD5m92Mhii+LHjG3c2HU1Agdj2N1u7m
	gE+fRxN3MJQRjJyPROflZ/JEbJPPr7GAt1PuXDbbd8pjSxt6KSfMILndQYXnTw+fltOZ1ZYtQw6
	zz4wC6/zCJRJ/usFbCQf+rrUimvBFIIg==
X-Received: by 2002:a05:7022:170f:b0:1b5:4aba:b087 with SMTP id a92af1059eb24-1b54abab148mr2544981c88.3.1795082853869;
        Thu, 19 Nov 2026 02:07:33 -0800 (PST)
X-Received: by 2002:a05:7022:170f:b0:1b5:4aba:b087 with SMTP id a92af1059eb24-1b54abab148mr2544960c88.3.1795082853232;
        Thu, 19 Nov 2026 02:07:33 -0800 (PST)
Received: from resolute-linux.lxd (124-218-37-86.cm.dynamic.apol.com.tw. [124.218.37.86])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm19916986c88.11.2026.11.19.02.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:07:32 -0800 (PST)
From: Aristo Chen <aristo.chen@canonical.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>
Subject: [PATCH net] net: dsa: felix: fix NULL pointer dereference in felix_port_enable()
Date: Thu, 19 Nov 2026 10:07:10 +0000
Message-ID: <20261119100710.129379-1-aristo.chen@canonical.com>
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

DSA registers the user ports in dsa_tree_setup_ports() before it sets
conduit->dsa_ptr in dsa_tree_setup_conduit(). On teardown, it clears
conduit->dsa_ptr in dsa_tree_teardown_conduit() before
dsa_tree_teardown_ports() removes the user ports. RTNL is not held
across either pair of steps, so user space can open a user port while
conduit->dsa_ptr is NULL.

In NPI mode, felix_port_enable() calls felix_cpu_port_for_conduit().
For a physical conduit, that function reads the CPU port index through
conduit->dsa_ptr without checking for NULL. This caused an oops on an
LS1028A RDB when systemd-networkd tried to open a user port while the
switch was being probed again at runtime:

  [  166.722423] Unable to handle kernel access to user memory outside uaccess routines at virtual address 0000000000000028
  [  166.816908] Internal error: Oops: 0000000096000004 [#1]  SMP
  [  166.961766] pc : felix_cpu_port_for_conduit.isra.0+0x90/0xb8 [mscc_felix_dsa_lib]
  [  166.969289] lr : felix_port_enable+0x120/0x1a0 [mscc_felix_dsa_lib]

The oops left RTNL locked. Later operations that waited for RTNL hung,
and the board had to be power cycled.

NPI mode uses one CPU port for the whole switch. Changing the conduit
of a user port can move the NPI port to another CPU port, and the check
in felix_port_enable() keeps user ports that still use the old CPU port
down.

For a physical conduit, compare dp->cpu_dp->index with the NPI port
instead. DSA sets dp->cpu_dp before it registers the user port and
clears it only after it removes the user port, so the check keeps
working while conduit->dsa_ptr is NULL. As long as the physical
conduit is set up, conduit->dsa_ptr and dp->cpu_dp point to the same
CPU port, so the check gives the same result as before. LAG conduits
keep using felix_cpu_port_for_conduit(), which does not read dsa_ptr
for them.

Fixes: eca70102cfb1 ("net: dsa: felix: add support for changing DSA master")
Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
The crash was seen on a 7.0-based distribution kernel. I applied this
patch to that kernel and probed the switch again at runtime 117 times
on an LS1028A RDB, with systemd-networkd bringing up the user ports.
Each time, three user ports were opened before the conduit was set up.
All of them came up, and there was no crash. The check also still
works: after one port was moved to the other conduit, bringing up a
port that still used the old conduit failed with "Multiple conduits
are not allowed". I also unbound the switch 10 times while bringing up
user ports that were down. 22 of those ports came up after the conduit
was torn down and before they were removed, with no crash. On net,
this patch is only compile-tested.

 drivers/net/dsa/ocelot/felix.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/ocelot/felix.c b/drivers/net/dsa/ocelot/felix.c
index c99fd3d23bb3..76aabb8e2887 100644
--- a/drivers/net/dsa/ocelot/felix.c
+++ b/drivers/net/dsa/ocelot/felix.c
@@ -1239,8 +1239,19 @@ static int felix_port_enable(struct dsa_switch *ds, int port,
 
 	if (ocelot->npi >= 0) {
 		struct net_device *conduit = dsa_port_to_conduit(dp);
+		int cpu;
 
-		if (felix_cpu_port_for_conduit(ds, conduit) != ocelot->npi) {
+		/* Do not use conduit->dsa_ptr for a physical conduit. It is
+		 * NULL before DSA sets up the conduit and after it tears it
+		 * down, and opening a user port can reach this check in both
+		 * cases.
+		 */
+		if (netif_is_lag_master(conduit))
+			cpu = felix_cpu_port_for_conduit(ds, conduit);
+		else
+			cpu = dp->cpu_dp->index;
+
+		if (cpu != ocelot->npi) {
 			dev_err(ds->dev, "Multiple conduits are not allowed\n");
 			return -EINVAL;
 		}
-- 
2.53.0

