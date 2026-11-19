Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092043;
	b=e+Bn11cI5mZV+D7IoO31oxxD3Kz2JQk/KdUO11cerCkLLcIOTmokymmYAMkLsBKU/S8X
	 TdhwPanyfpaPD9i/SLS2yCKtP79304XRE1ht5Ana6XMudDbVQ0YOTwOtfWB4PzEn99rdo
	 EprS5K5h0/hBUzR3taBaj+eaJ0wzgoZUZyMAOeLCNg3u8vh03MP/gzLd9PKpOlKbF9wbO
	 DX2rX1ZGK1LLqWlF4wOO8Vva/Fj9d494eOJ7I+78BO7Rkpz0K+fL4Wblv840Wljn+dYr3
	 JK3vHH1JmzppNnT79h5HJuY1OrFVQU6qBmLmnk4p6Rm413VPjHb5rnTcrzvEiS1X4xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kZTCP0FZNEDqOM0wu+GOAnEdBFK1bkrsKWVusL46FiY=;
	b=ODpKjOArXV6fS/E1UYld2QyVG7CGvA6yd23unxu2X0nVa1AfRonCcM952HeklSR6Qho1
	 1V+UxxlFb6I+wIrGdOLSLwCVoqZ3aa9TGGLTOsv9O+pxt+Up9OUw2CvpSrzjw28KYRiim
	 /8PCRh+Vk28YYYy/APEBt6kq7exuF7/fKoCsLMPS+lP6cXfRYP1rvkevFXbRyrpCUXhGA
	 AB8tNYD3iABn6xVGo5+zL/dwwW6MHfyTij5a60y5BvISgsxj/HiL+oG6/qVeidADmzqVU
	 m4FSGZDhTzWNZ377loT64ZxB4PA9KZe4NwxDJYW8cz+NeFs0zgUBvTrQ0rkzk9THHTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=qlqnTANW;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD60F606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 12:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD60F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=qlqnTANW
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-55d30c054dfso23095771cf.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 04:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795092042; x=1795696842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZTCP0FZNEDqOM0wu+GOAnEdBFK1bkrsKWVusL46FiY=;
        b=qlqnTANWHGUlzDo1V8GPg9BudgD19NxwE9qOTUzPM4Ra6aDF9fNTr7XEtB6DFqA0nr
         BMeDdvVE87lHE3emUIDC61FQEO2+6anjzvYSg8UDzqufus1YIj+JmflrGRN4qTaPeqes
         5RI5iVliNbtsAhqohm0AWXWFFAHkKibOXVNX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092042; x=1795696842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kZTCP0FZNEDqOM0wu+GOAnEdBFK1bkrsKWVusL46FiY=;
        b=yklU+TeIxWlK2z5agzHDZsrH9MzuYre2QY5uE4QG31ayVaZbf+yEnZ5cLTUAnEnC4D
         Cd56dX4rZWvpMmV+I1FLP1d0HOaEznBRspFSCrjVREdj8uDJm/IZsYL94OIXOdHmSuU1
         XWW24znJ411NkOxAGOy+oYP3rTF12vP9CLAETvRunam/mhoqaJQVjANg181EGrd2ZFo0
         +odGltRUEYvGMkMitH8yGLALm3iUP1FX0w6y81qpAn7b3tKcC+FsZkB16WenVLBCoh1t
         NRe0kCDoOAy86G+9MMRWdBJgJHhuoipfB8wwDemFLkLdBjVA4ExKLfxMA0RejwVUX3d4
         7RIA==
X-Gm-Message-State: APuU4Z8gIUBYpSSQIKVEuru7KOCHgi9R3Ohaj0P0wWCQdoWieagFpaP8
	4SCb6Mn3uJpP0D2gVJBY/u0jqXRptoJSAxkbo0UpK86SuJjqpjqGMzokvhzFPHCiqdzE0VkrPYT
	OP4Q=
X-Gm-Gg: AYBFou0AaBj0UZIgx4R/ZtLLpvvRvy8ZeCBh3A5gm9SHSEarHo5BSlitKrR9cVe+WJK
	SB4qQnrWiufIOEi+CQV4qrvBUAD4W27EdB0LCcjQ2Zq9f8EWjhu2FCORkG7XMX3AzGkjRAX4nab
	fyBEsU1vqJmi0RxxiLgr+LTiM/CmGMztN03w8wI2/nuw4/iUVSQwl3AFl8ixq7EmRygECpG9Qsh
	PTwxMFUN3sEerXNVWUN3OmppA0RRUN1S7aIPjI6qSKM7SvxnvM98xXwjLhVK5CAl2oJL0oXmGqI
	PD5aFLWLGLaKE5XPIipWYko1arUNpPqwb+aIZewOq0SbAINaBbvplkMUIcGp0olMkuJewXBXbG2
	bdMam6pAR92vvo2I3gqDhE4XYyPjuNfAKfaDt97Clg63V3fgekT9u71DfdnBw94eMtqYd+G2l7h
	cpbp3suR7eOdtliIHPH9ES5thibbGrMFAIjGI+rWvV1V58A1VdyPlJj+qPVggUCoHtUW7rthUOj
	2x4ObA1Xtt2s/bdQyhXBeuyf1obnskAhfSDE6tuR5NZ8n6tUr8KdIBahpC+MTLOg86AnYdGrI0V
	4cs8cLvi5C7LipGKvZI3GPLf8n01f/IFBgFHzLL9jRP4bPYECrB8RmK8nHmzkjewhzMqSE9CzZc
	=
X-Received: by 2002:a05:622a:1822:b0:55c:8e35:c71c with SMTP id d75a77b69052e-55d5a69b306mr91009941cf.47.1795092041468;
        Thu, 19 Nov 2026 04:40:41 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66b75823sm22370191cf.13.2026.11.19.04.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:40:38 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Victor Nogueira <victor@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	stable@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: [PATCH net v6 3/3] net/sched: sch_teql: keep skb->dev consistent on the arp-queue path
Date: Thu, 19 Nov 2026 07:40:25 -0500
Message-Id: <QDISC-6HS9.v6.r0.20261119070330-3@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <QDISC-6HS9.v6.r0.20261119070330@mojatatu.com>
References: <QDISC-6HS9.v6.r0.20261119070330@mojatatu.com>
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

This is a follow-up to commit dc4b95b8fee9 ("net/sched: sch_teql: restore
skb->dev on the slave failure path") by Victor Nogueira, which covered the
slave side of the same mismatch.

The issue:
teql_master_xmit() sets skb->dev = slave only right before the slave's
ndo_start_xmit(). If the slave's neighbour is unresolved, teql_resolve()
parks the skb on the slave's arp_queue with skb->dev still naming the teql
master. teql_exit() frees the masters on module unload and a slave can
outlive them, so a queued skb can be reinjected through freed memory.

The Fix:
Set skb->dev = slave before teql_resolve() so the parked skb names the
device whose neighbour owns it.

The parked skb has a second consumer: when the neighbour fails instead of
resolving, neigh_invalidate() hands it to error_report() and
dst_link_failure(), which read skb->dev to report the failure, so it names
the slave on that path too.

A parked skb is reinjected by neigh_update_process_arp_queue(), and a
device that transmits straight on skb->dev has to be handed its skb back
there. That is the previous patch, "net: neighbour: reinject a parked
skb through a headerless output device", which has to be applied before
this one: without it the parked packet leaves the slave directly, with
no link header, because teql_master_xmit() has already pulled it. The
helper it changes, neigh_update_process_arp_queue(), was split out of
__neigh_update() by commit 705ef89ac986 ("net: core: neighbour: Extract
ARP queue processing to a helper function"), so the previous patch does
not apply to stable trees older than that.

Some context:
Only a module unload frees a master. teql_master_setup() installs no
rtnl_link_ops and default_device_exit_net() moves the device to init_net
when its namespace exits, so the window is a parked skb plus CAP_SYS_MODULE
on an unloaded sch_teql.

The error now names the slave, so it is also routed for the slave: IPv4
takes the ICMP output interface from icmp_get_route_lookup_dev() and IPv6
from skb->dev. A teql master enslaved to a VRF had its host-unreachable
looked up in the VRF and now has it looked up in the main tables with
oif 0. The parked skb cannot keep naming the master there, because
naming it is what lets teql_exit() free it under this path.

Conditions to recreate the bug:
CONFIG_NET_SCH_TEQL=m and CONFIG_VETH=y, run as root. Create a veth pair,
make one end a teql slave, give the master an address and a route, flush
the slave's neighbour entry and send one packet:

  ip link add v0 type veth peer name v0p
  ip link set v0 up;  ip link set v0p up
  tc qdisc add dev v0 root teql0
  ip link set teql0 up
  ip addr add 10.0.0.1/24 dev teql0
  ip route add 10.0.0.99/32 dev teql0
  ip neigh flush dev v0
  ping -I teql0 -c 1 10.0.0.99 &
  sleep 1

The skb waits on v0's arp_queue while the solicitation is in flight.
Remove the qdisc, which drops the module reference it holds, and unload
the module while the skb still waits:

  tc qdisc del dev v0 root
  rmmod sch_teql

teql_exit() frees teql0 there. When the solicitation then fails,
neigh_invalidate() drains the queue through arp_error_report() and
ipv4_link_failure(), whose __icmp_send() reads skb_in->dev; that is the
freed master before this patch and v0 after it. A resolved neighbour
drains the same queue through neigh_update_process_arp_queue().

On the unfixed tree the skb is parked on v0's arp_queue while skb->dev
still names teql0, so the reinjection can reach a master that teql_exit()
has freed.

The park and the headerless delivery reproduce without the unload.
Freeing the master while the skb waits needs sch_teql built as a module,
as above.

An unfixed kernel reports this when the timer drains that queue:

  ==================================================================
  BUG: KASAN: slab-use-after-free in __icmp_send+0x3f9/0x1680
  Read of size 4 at addr ffff8880039bc0b0 by task swapper/3/0

  CPU: 3 UID: 0 PID: 0 Comm: swapper/3
  Call Trace:
   <IRQ>
   ...
   __icmp_send+0x3f9/0x1680
   ipv4_link_failure+0x3a0/0x5b0
   arp_error_report+0x5b/0xc0
   neigh_invalidate+0x125/0x240
   neigh_timer_handler+0x47d/0x750
   call_timer_fn+0x138/0x410
   ...
  Allocated by task 307:
   alloc_netdev_mqs+0x81/0x930
   ...
  Freed by task 335:
   netdev_release+0x45/0x60
   device_release+0x7d/0x120
   kobject_put+0xf3/0x2e0
   put_device+0x13/0x30
   free_netdev+0x3b3/0x4a0
   ...

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: Sashiko (nipa) <sashiko-bot@kernel.org>
Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260824115928.4099988-1-victor@mojatatu.com
Link: https://lore.kernel.org/netdev/20260824115928.4099988-1-victor@mojatatu.com/
Link: https://lore.kernel.org/netdev/20261026160747.283702-1-horms@kernel.org/
Link: https://lore.kernel.org/netdev/20261031165925.780930-1-horms@kernel.org/
Link: https://lore.kernel.org/netdev/179363700308.3131.11778179538290251434@kernel.org/
Link: https://lore.kernel.org/netdev/20261110101908.2e64e8e9@kernel.org/
Cc: stable@vger.kernel.org
Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
v5 -> v6:
- the commit log names the neighbour patch this one has to be applied
  after, and the ICMP error routing the skb->dev move also changes.
  Considered comments from Sashiko (nipa).

 net/sched/sch_teql.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/sch_teql.c b/net/sched/sch_teql.c
index 44730a5e8917..d1c66bd039d1 100644
--- a/net/sched/sch_teql.c
+++ b/net/sched/sch_teql.c
@@ -379,13 +379,13 @@ static netdev_tx_t teql_master_xmit(struct sk_buff *skb, struct net_device *dev)
 			continue;
 		}
 
+		skb->dev = slave;
 		switch (teql_resolve(skb, skb_res, slave, slave_txq, &hlen)) {
 		case 0:
 			if (__netif_tx_trylock(slave_txq)) {
 				unsigned int length = qdisc_pkt_len(skb);
 				int rc = NETDEV_TX_BUSY;
 
-				skb->dev = slave;
 				if (!netif_xmit_frozen_or_stopped(slave_txq))
 					rc = netdev_start_xmit(skb, slave, slave_txq, false);
 				__netif_tx_unlock(slave_txq);
-- 
2.34.1

