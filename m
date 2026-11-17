Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927202;
	b=0RZe7qj68LgeUCv3R939XWJAVQkxjwNERmrsu5PjclPDVvIVlpK/WSTMlVn9p4HAdKxg
	 9+KQrN318U5oD+Mgjr1L/O75Sl41p9ciwUttIJxIYcoqwCEKO4y0q1jUrz9rAgorj9Xyc
	 0jNTsAWHA9mFBNz7K1aMdvB5upi8Rp0tJFW842LtxjSwzoxNoowVku4IuzvafVO70QIq/
	 AJXUL22CPOpY3tUUG+ac5BK2oyF+m+hNsLvYR+MPFyTKu74/fzRLtIugFrikYg3XH7m01
	 8Pdn4hkhfRIbzMwN3ZG/uT3RKk1W/eizQD8XBtT6PEkvQ2viwmoFZ6cdJvHbRK9Bhug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LAxy3goky0t3VPjV6FUpbe6k2gJl15O6ptslh5cvBS4=;
	b=v+xnB+Uw4PBZTD2ev3D4A5+BAnEuGSNLCrN/jGL+sz4vfkwAWkx6fWWc5bF3IYYZjIet
	 n+0o5flyutE/HL78U3otwgL4cCdUlj7uVDT9QL1oGk9EswYzoDvAW5axXjQD8WHBiY2FX
	 CWOf/xtBgP3wHU1hw5GXnw8dyKR/NKI60hrHf2NdZzOUO2TbduGhExJnyUnNZy6311nV9
	 eJjlNzTBHjrlFIJ4lG2kLt7gH+MVD7Ro7DUXz+wkCCXdkjJwYsfsoYTzBqYVSEBGyvB2A
	 He5ARUC/bNR/tvH4Ma5rkJEytCF8i89mgniYrkwdUExWJkLqgsNhuxZbP8pSFx20MYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fzb9MBq1;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A82606A33D
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57A82606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fzb9MBq1
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso2016784a12.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 06:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794927202; x=1795532002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LAxy3goky0t3VPjV6FUpbe6k2gJl15O6ptslh5cvBS4=;
        b=Fzb9MBq1nqqQ5zjQ+Wx2/Vjq33FDWcUWLbn5DIgBawulgIj6LpCy5iJd/uWlAO9x9k
         Wrz8JnYfU3Hsfb6nH+cni+gd4X00dOuvLXQf7tzTdblTB5SMd2uWyoDcBcVAnU+S745f
         QXA1LMI79dL3VlgXr0M5a56GkxxvvIuovTWut1uUPQ9ctBxtdezWs96MKudaZQp280R7
         TFzwaPeTNLG82php9XbT7FlWi9zDqwBjRK+nSCZRPcNeDh6skRtWIv4ErLjfK8JttYuK
         G0Dc+csvkFhHmnt/zicMRDo8kJuztfc8rKqcvbXtXWyCX+T1hygJFv/dC9VhjQT2BPVx
         pYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927202; x=1795532002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAxy3goky0t3VPjV6FUpbe6k2gJl15O6ptslh5cvBS4=;
        b=lmwnIWDuKA1L7yZHm276h3VSn0cTpsNOiXZp8hfsYPHUH67AwedoJuZTNHEq4c5BHx
         LL2QWlMGTZRxPTuD4YrKFoEhuDtj7R+EE7ZHJlaZ/7tJZZ/sOTUe2M7w4LZ1XjnNXakW
         WvfTffEw7KHAGa1inavpc6HnmsQ7T8eKP+dllgAyIvGnsvrlx/hVDfAYEFy1+wd/VpTj
         IUVJsCFB/ZNvfxPLZoHdxM8eusqUIrIhWKLE/p+bHKTBQaB3OJF1jb7I6M9q0OuwiGZu
         /SMjHmE7ArV5GzzDjodQIM6rbFwhLSLjqrYqDzxWbf+W+gu8Wq1N8lqCJP3mVMEkck4M
         +Bzg==
X-Forwarded-Encrypted: i=1; AL+hErHY/bkrc6j/eJaHbxHBdD/H87JR5iu1AZ+Jq7huuaDdqjoMvVmAYWrXUBZd/XSTspsqNnH0BXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bdC7u74Y2ITKpXjZsVdNzMxqQbpA2RdaL22Nk+sbGoiwwcaQF
	O/9/cTA6MQHMV6/oTue8Gs3F1ypl0z55KzWl/vWZ09esjvykvAmk9nou
X-Gm-Gg: AZFdTZeqvzsIRg4EK1kzEkh+oVqiLSRGxTk+qP8X5J4Ne40tG/5f3ldkR06TfQRNQ9o
	j5o9dy+UqmBp3HZqTw2XQRCIJsNP9jyxVmtPbKHjkVNV1TqwY5bgIk6G9e+TLUwCzU1Uflzu134
	pYyLpc76enWsrjQDOwwi0bYvhkTbGpYyC3hOqn4bFYHKUy4CktQGb7GZgCAWSBDv6GJj4kvhmUf
	CsX+EdixIn2KViBfx0tpB5BmUlZsKUD1fNcMABPUAvWeridk1VlDAZcWCNCRUKttc3TOYiJKelS
	YnXTAG3gmbPrnvZ0NOCvs1Gx5orhm33nj/gTzcAUOGKaoXV3+xG5d63Tto4Rb3fOCrwSVuydiFF
	+Ii0rccSvfSRPp8aa9vdQHppaS2FmihDCj/yBdHSAWTVcU6aM7r3PXLpwZNpeIyxGzE9DnKun07
	y7KHlXv8IU0UbUTbQY31EqskiflShDoDpdiQ9j523/3G7bNKg/XU929IlhJwshDTGtLwv6ZUmsa
	pnIEnTWjLWnccrlYAU7QpzAKhAxwnCKoahVBZi0mzskKIOmbkig/IrCO+riHWCWw8P2YekYDA02
	oSzU+2xX8rw5I8anUFoI9Z5X+AMja1c72bPJnhkYvCc2orOrDfL2ykbKQxfTD6nKqvkoN6jZuKK
	ylkIcAI4sEsYC9kFwPaSzLT1M/GGJUWgHyJfflJ/o
X-Received: by 2002:a17:90b:3a0c:b0:3b1:7329:a121 with SMTP id 98e67ed59e1d1-3b1b0a0e800mr12479951a91.12.1794927201457;
        Tue, 17 Nov 2026 06:53:21 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18a2191sm6056636a12.21.2026.11.17.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:53:20 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: mst@redhat.com,
	jasowangio@gmail.com,
	eperezma@redhat.com
Cc: kvm@vger.kernel.org,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] vhost: synchronize worker freeing on vhost-net teardown
Date: Tue, 17 Nov 2026 22:53:14 +0800
Message-Id: <20261117145314.1092372-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

vhost_workers_free() only waits for RCU readers when sync is true.  Both
vhost-net teardown paths pass false, relying on the assumption recorded
when the sync parameter was introduced (5efd97e6f0c7) that "net and scsi
stop their virtqueues before the workers are freed".

That assumption does not hold when a tap queue is detached while the
socket is still attached.  __tun_detach() runs tun_queue_purge() on the
detaching thread, so skb_queue_purge() releases the zerocopy skbs and
vhost_zerocopy_complete() -> vhost_poll_queue() runs there rather than on
the vhost worker.  The vhost_dev_flush() calls in vhost_net_flush() and
vhost_dev_stop() only wait for the vhost workers, so the queueing can
still be in flight when vhost_dev_cleanup() frees the worker, and
vhost_worker_queue() then dereferences freed memory.

Pass sync=true from vhost_net_release() and vhost_net_reset_owner() so a
grace period and a flush are observed before the workers are released,
matching the vsock RESET_OWNER path.  Both are slow paths, and the extra
grace period buys back the races described above.

Testing: QEMU/KVM guest with KASAN and CONFIG_VHOST_NET, zerocopy enabled
via vhost_net.experimental_zcopytx=1.  A second thread detaches one of
the tap queues and frees the queued skb, and vhost_worker_queue() is
delayed with a fault-injection module so that the close() or the
VHOST_RESET_OWNER ioctl completes in between.  The delay only widens an
existing window; the detach, the purge and the teardown are all
unmodified upstream behaviour.

Both teardown paths reproduce the use-after-free on this base, and both
are clean with this change while the injection is still taken.  The same
injection reproduced on the earlier base where the analysis was done.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

Test details.  The guest runs a KASAN kernel with vhost_net built in and
zerocopy enabled through vhost_net.experimental_zcopytx=1.  The trigger
attaches a tap queue to a vhost-net socket, queues a zerocopy skb, and
detaches the queue from a second thread while the owning process closes
the vhost fd (or issues VHOST_RESET_OWNER).  The second thread is the one
that reaches vhost_zerocopy_complete() and then vhost_worker_queue().
The fault-injection module resolves vhost_worker_queue.part.0 from
/proc/kallsyms and spins only when the caller is that detaching thread,
which makes the window deterministic; kasan_multi_shot is used so the
remaining reports are not lost.

Results on 666539eecdf4, one run per teardown path: the close path
reports slab-use-after-free in vhost_worker_queue() four times, and the
RESET_OWNER path likewise four times, with the free stack going through
vhost_dev_cleanup() and vhost_dev_reset_owner() respectively.  With this
change both paths complete without a report and the injected hit counter
shows the delay was taken (1 of 5 probes for vhost_worker_queue(),
the other four being callers outside the detaching thread).  A control
run that closes mid-test without the delay is clean.

The same injection reported on three consecutive runs on 776b6be748eb,
which is where the analysis was originally done; the reproduction above
is the confirmation on the base of this patch.
---
 drivers/vhost/net.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 4570a4ffbab2..631855064b3d 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -1452,7 +1452,7 @@ static int vhost_net_release(struct inode *inode, struct file *f)
 	vhost_net_stop(n, &tx_sock, &rx_sock);
 	vhost_net_flush(n);
 	vhost_dev_stop(&n->dev);
-	vhost_dev_cleanup(&n->dev, false);
+	vhost_dev_cleanup(&n->dev, true);
 	vhost_net_vq_reset(n);
 	if (tx_sock)
 		sockfd_put(tx_sock);
@@ -1661,7 +1661,7 @@ static long vhost_net_reset_owner(struct vhost_net *n)
 	vhost_net_stop(n, &tx_sock, &rx_sock);
 	vhost_net_flush(n);
 	vhost_dev_stop(&n->dev);
-	vhost_dev_reset_owner(&n->dev, umem, false);
+	vhost_dev_reset_owner(&n->dev, umem, true);
 	vhost_net_vq_reset(n);
 done:
 	mutex_unlock(&n->dev.mutex);
-- 
2.34.1

