Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.58.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653298;
	b=vy++/B/zDsA124OGbHmJATFQKRA0Fu2Mv0VbWbFsALezE+O8nkdMk4yj8Rip9vqdqekO
	 pdwKy9iHUvC8Z+Oa16xYxNY5WGSf14UdkVGumY6AS7E4OmzjqovfAhVRYPHVYakSeLWaE
	 stfgB/T9Z3fZr/rjvRFqqaeKdu0dooMLyU4xeUiPhisWVOI/OFpt/DxoZ5M3fpmJg5/HW
	 r32aPHeWe193gLTeCXLsMvdtZRv4iFQOFa8F8AIdRvXTTuGHlpF5BJYBlFgEe8OVBBqAn
	 /qd3WicSAI28z72klCkznYd3jNa6Y3WU4wOg0A+wX9YjDjuqyQRTXm/XcUPfYb0YCWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653298;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=bqinDQN+cZ7qIF0PTtyQEbakguVUSKCjXZGxurM9Gv0=;
	b=hdDUBW61rjQ8yb3bJAHcV5mE/x3uJJYJAXVjzh7wObazZN5n7VuVfNPvCY5ThoR5+GIt
	 lG+1xyJCJyS1E5pT0yinMGh1dZm2hDuLIrWRN6UGGeDo3ACmBs1NCHtKa+cEAJb03V/PE
	 uOW1FuKTT5VALgaSpen95YjaTxu6Bjp7oBqsTE6rcvfyFmltUtNoxfjw1hiNt6Ayzz7wV
	 iS/SPcFwq56vwyRbhOOsRVsd5IMxr/K9KfcrfLAWk54+kBhZUfSGxEP/+F2BhrA/c9jRU
	 UYYdD66/1E3juuZwDCJm/Oatzmtv6l9P6YMz8ZMkiduz/zSkYcWGrvV3nR58i1ZW7ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=oFGHZjhC;
	arc=none smtp.remote-ip=162.62.58.211
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90D3606A31E;
	Thu, 26 Nov 2026 00:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E90D3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=oFGHZjhC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795653291; bh=bqinDQN+cZ7qIF0PTtyQEbakguVUSKCjXZGxurM9Gv0=;
	h=From:To:Cc:Subject:Date;
	b=oFGHZjhCWNABo5//G2T80aSDmK8u55WolVTKj5/W4XStZNS3wkrMEWl9yOZcyqUW2
	 gB38nRet5sGLEJmCAHEreWsgsw5vH6K2GfHzvaP9uLFMRW0aPyIYTGLd0/fkiYKqPK
	 rD8xFnWScdywqku+B+EUMbHUS+Dnh8ZvBg6PS6mg=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.198])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 8B01F4B6; Thu, 26 Nov 2026 08:34:48 +0800
X-QQ-mid: xmsmtpt1795653288t73q4h236
Message-ID: <tencent_934E899D4D24BB3B4827B2A0C9D73461E00A@qq.com>
X-QQ-XMAILINFO: MqswyhUqVe0CRC25e21QnVsEQWYU2BVBdfLZmOozyc3VIIy1KxxCoOs8PXkHIz
	 d05XOAXMuLfGM/pBUcrHnGz1xYZoE3rIqD1Ud/VbPHUEHjVj8AObhQZxHWE4F7rn6oiy37FyF0fN
	 I2cWTrf0DxwFwoN49bQjCSDBe91VZuySsbHD9//7KQ7oJUDdj+PNwWdn7Xvlm9JqfJNOhCzbBFXp
	 Uh0eoxJlzT7t9Br0lCQu/kZQOltzKeJhHqSZgmthus1i+XzkP/GUdgjAhDNSuOfXETUjecYc1too
	 VfpM9tINIGfY95PPLnxLDqGH+95zo1FjupE0UzN5+fQzNJEIZGYIQn9iuB5N4XTIYx4pfqyI6HBt
	 ySwofG5ypfDw/heQ6IOxvLqbXC7dVsUhB3bk96ylOy4YNSoV0qaXexBgd2VGBEBo4dCusNwyri9I
	 P0r3GiiQguZUfyRoKi/DemJOoYGVbAWhRTuvzeERwqZ8lnbJk0HeZ7H3lgf+tDd2ZIY5OHrYzz4V
	 m4tYSer4+sNLD/sJc1bHLMZGPZ8JTtSljbxk+nc+4f1SypJbilW9fBJCXw7CJXyPV9PYvt8PC0cF
	 qBg5KBQKISue/Qwtc26OEpEg8gONte3wVeU3MjT2nirQAoLQAlx6LJ9mL9ljZcNW5FWFUkDM7EN1
	 v2KZbXkJpH0l91s7nqAViPuBG9v/u+H6fgdWew0/AZTkNRLWlUq3hrUXjxOXIQFvWrMIi7N3WM+t
	 ShsIUA0EuZOe6ji0/ikz5Plqhck/YFfsA9oJ15kDGYVLyyQTPOnkj2TlXsg1p4IFLHKvpTZw2iIV
	 gAn1Ye2mPbHDHp5KpEcS89Xc3R1hG7XN6zPCye/ufAflUS2UKrPzwFGbRajjIvwB3n8DUrPamsXG
	 dJkcLV0tLcSVIsFefyiDO0qZ2pChhFQYF1RgO6q14ZlCyTVjQzYMxUzDlJW8f6SzXiViHSmp/m3I
	 /U3kTS9yH6Un2KUQXS+k34ALuxhZxdUM+EWrrVVyqgQ67a30Oe9ViuuKJgEpHTGIf/zH+vGZ8bGo
	 LTaFFsn/7AglrQKm0Sgw0d9aIwKNcSsrRQVzTBp/aJvTOYBZuQj2JSjhIPZiYpNAcyjAvZMcLGsd
	 5n8QjP
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Shuai Liu <847807867@qq.com>
To: willemdebruijn.kernel@gmail.com,
	jasowangio@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: syzbot+a2220efe757ca2a7358d@syzkaller.appspotmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH] net: tap: fix inconsistent lock state in tap_sock_destruct
Date: Thu, 26 Nov 2026 08:34:48 +0800
X-OQ-MSGID: <20261126003448.3113461-1-847807867@qq.com>
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

tap_sock_destruct() calls ptr_ring_cleanup(), which in turn uses
ptr_ring_consume() with a plain spin_lock() for consumer_lock.
This destructor runs in two distinct contexts:

1. softirq context: from softirq rx drop paths via
   skb_release_head_state() -> sock_wfree() -> __sk_free() ->
   sk_destruct() -> tap_sock_destruct().  In softirq the BH
   state is already disabled, so consumer_lock is taken with
   SOFTIRQ-ON-W semantics.

2. process context: from tap_release() -> __fput() -> sk_free()
   -> sk_destruct() -> tap_sock_destruct() (triggered by
   close_range syscall).  Here softirq is enabled when the
   same consumer_lock is taken.

lockdep flags this as inconsistent {IN-SOFTIRQ-W} ->
{SOFTIRQ-ON-W} usage of (&r->consumer_lock) and warns about
a possible deadlock scenario.

Fix by hand-rolling the cleanup loop with spin_lock_irqsave() /
spin_unlock_irqrestore() so consumer_lock is always taken from a
uniform softirq state.  irqsave is a no-op on the softirq path
(interrupts are already off), so there is no extra cost there.

Reported-by: syzbot <syzbot+a2220efe757ca2a7358d@syzkaller.appspotmail.com>
Link: https://syzkaller.appspot.com/bug?extid=a2220efe757ca2a7358d
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 drivers/net/tap.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 2f19fb07bb2d4..d749c7e73858a 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -440,8 +440,18 @@ static void tap_sock_write_space(struct sock *sk)
 static void tap_sock_destruct(struct sock *sk)
 {
 	struct tap_queue *q = container_of(sk, struct tap_queue, sk);
-
-	ptr_ring_cleanup(&q->ring, __skb_array_destroy_skb);
+	unsigned long flags;
+	void *ptr;
+
+	while (true) {
+		spin_lock_irqsave(&q->ring.consumer_lock, flags);
+		ptr = __ptr_ring_consume(&q->ring);
+		spin_unlock_irqrestore(&q->ring.consumer_lock, flags);
+		if (!ptr)
+			break;
+		__skb_array_destroy_skb(ptr);
+	}
+	kvfree(q->ring.queue);
 }
 
 static int tap_open(struct inode *inode, struct file *file)
-- 
2.43.0

