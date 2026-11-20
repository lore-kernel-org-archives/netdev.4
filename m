Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173558;
	b=ZgTdiQifzjvx8/Ew2zOjZXjCsM8GBUwic72SUWUeitB7jepJcLUFkVBCrggw7m/zvZlX
	 xCv4WegUvfCOEdMJdoXG2h571+6HPsA8obEc0FBrqq77QzhBqWFDlQTCbwtufohmhSrtd
	 Uo4CObr0caagbpsjix2klMAUM6O0DE9dYKfPJ2qoaqkkd52Aaj43pvtevgcshM/oEUMPZ
	 k6B++ExKSQy1nAlU8PLHZX82V1SSH5P0xqkrvKVBH/qSLhygL59DeakssipMFxBjHzjdB
	 /lB+bzPF4C8EEd3+hZvzfmH46C79Q8Co86xrD7eNgdEwS8MlJ6k+FtYKtGQYTOZAAIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cO7QiRpUot9Vz25lkQZDD0fNa3WCQpmTa73WBgTVjk8=;
	b=c8f8ltQuAebCT9SSqoSpQ2Z4yACyhb4hSaShyuw6yFBwH4SCtWFiyqOLDXBbe2ZT0YuU
	 O9orUxG6b7fl0iugrbyDH33YVVJNX2CIBzieF8LjAMeqhipc1UZkJD6OrOtfEugtu7Hfn
	 0kQiFUh/V5vw275ck8HopTcP9unmG67IASjd6FU8IanR31NihDs2RIx9Zx37+l7sn5o0u
	 NL8N3TIxRi8YtISXjS035GFag8n9Pg1VwlM/mqS5NwupWjONGhbfsDV/r2/Q2w3NAryv0
	 DxRVaZDGB5g5Y5GndzuvY8xlUXMQjqQ26nAB5N53kWFzqAv3p8MrJqYlFmpzTiisL0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvqD4Pve;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41AA606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E41AA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvqD4Pve
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso316846a12.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795173557; x=1795778357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cO7QiRpUot9Vz25lkQZDD0fNa3WCQpmTa73WBgTVjk8=;
        b=uvqD4PvefDfCYawdcK8xfOke5kh4ebqkVLbhfhlyznmi+YdFEJnYB7CLXX+DqFiLBi
         +AUAn7T0N9wKeWlPwzfk/TfhssK5JetXq4D6Ut6A+OsxsT0aZwOsLDtP039n3y60/6Jg
         7w39bpMSKj3XVfubN7DviLW+G0hW6VpYKSf1hYdEno2jT5ky/UV/+c8VjkvSgYyTY9yZ
         2Asz1rjgQuM7Ex9rMxoDFJuFtHA40XPSM2/WXlXfi4EaYEWzfUgRqRPL1RmMoUZrkVxR
         t+oZ6HleMIMRUAM6sHW89GT7YSyrDxDLav6AnF4UwNQcRxV8Ybw21iS5IrCB9P39yNEr
         FVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173557; x=1795778357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cO7QiRpUot9Vz25lkQZDD0fNa3WCQpmTa73WBgTVjk8=;
        b=LfBFY221WdLY/8+olKfMPF0cHxJANelFSul1Zg8OHpqlbMbxp4aYeU8wj+Bcu0hrcV
         tA3jq7VSkAZMKdSjHvrszeipD8E/4WixIYvFpJKf/qmeq7giYeBpNHSi7EmhsTiPhexP
         xpR6XrIGNybBuji7rjcu+nCVZe9RV+I055g425wtwSZujIJpBc57bic5QaD3GFYtCaJw
         OuUlgV+cYPYcVuX1Hnoh3/QesNhXhfPmLal3DC2iVaNPO1LfUWiL4MldnPmpOzwcaksM
         9hctZpJ1VtSQqmsD1pK1mHQU7awsj4MwW2YcNXoT2Ual8nXa7PgR1Kg2ahnaEsqr8z1g
         LXLQ==
X-Forwarded-Encrypted: i=1; AL+hErGq84EgL1HcehgmxdvmLgtK4gMO/6XFPTzPUHjDtHaZLXw/4DNKcDK+MRvphfkJrSN+uTIetUc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6iJ6zmvGem3SXG++bPMHdTHnSpIORYd2XbbImlQChWX9KPeGu
	UmNq6HhgeyLJ4UAfxhqBAcF/pJbtu1r46gs5DoUHOWh+myR0INsO2FIg
X-Gm-Gg: AYBFou17yC9Ah16TMEAoHQuKIIStpU6GzKnzhHFJXydpj4QH1ZiWW7l1D3IsnRbpwIq
	WkIz0HZruejGXGgpYKhnak1R0YH/ZB+F9xNUh/CJw9B64G1Q1EkdwiYpMpB1oWcDDYOXFh1nBVh
	+q74C0z2so/Ya3npwjZSfK4+JllSJ13ncPNjV4FAkv4gt/Yan7EI+gZaSXf0bdPbVws8bUtrLk5
	4uie5xmCKFodyj6snAL79AjCC12OAno4iEDLagcWakFmJjZLX3aFxmOeYJQwlJf6vO8XyLe47ru
	Eo0/CpEaXC54gghAwjX19BILFqKJwRcDEhom6udvjuV7RGgWbQ837HhjsqRtcjpaO2LjCYumgCo
	nz9WPkNJ78I1wV1/NuoE8AEoubA2YBJngOnjnX9VmRtDKJigEaQ8eFM9DAnM9i7Czmq6mWgUZnS
	hKQwXp6Wk8MHfV/rOaXUSjY0e5fMMsauTpO1PR8hXrS3hU177tkxdeo1xyQ0djebsnJcyzc6Epr
	lvxfyJIZNvTiO++lRENVQ4HlyozFQH/Lw69dSXd+v7W6M+5/6gZroeTGxYaq8rWYkDvZvnHeH3Y
	xDUQ/CT9g9ORMX2MjMdKY3KI1+QXlU0ZCG3JqBvXmCLPiHti3e/G9c3isx2Fd4SzGF2oeopNbOJ
	gISSaSrqsirLZ
X-Received: by 2002:a05:6a21:4d8e:b0:3fb:a69:8480 with SMTP id adf61e73a8af0-4014e35c584mr2272208637.87.1795173556776;
        Fri, 20 Nov 2026 03:19:16 -0800 (PST)
Received: from JUNVYYANG-MC1.tencent.com ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c14fsm1367050b3a.15.2026.11.20.03.19.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 03:19:16 -0800 (PST)
From: Jun Yang <juny24602@gmail.com>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: phil@nwl.cc,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kadlec@netfilter.org,
	aconole@redhat.com,
	yifanwucs@gmail.com,
	manizada@pm.me,
	david.lee@trailofbits.com,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	junvyyang@tencent.com,
	corvus@tencent.com,
	stable@kernel.org
Subject: [PATCH nf] netfilter: ipset: do not destroy shared extensions on hash resize
Date: Fri, 20 Nov 2026 19:18:57 +0800
Message-ID: <20261120111910.67379-1-juny24602@gmail.com>
X-Mailer: git-send-email 2.54.0
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

From: Jun Yang <junvyyang@tencent.com>

mtype_resize() copies the elements into the replacement table with a
plain memcpy(), so the comment extension is shared between an element
and its copy until the resize completes.

Commit cffcf57bf03cb ("netfilter: ipset: exclude gc when resize is in
progress") stopped gc from freeing it behind the copy, but the packet
path still does: mtype_add() reusing a timed out element and
mtype_del() destroy the extension on the old table before queueing the
operation for replay.  The replay finds the copy in the replacement
table and frees the same ip_set_comment_rcu again:

  BUG: KASAN: double-free in rcu_free_sheaf+0x1b/0xe0
  Free of addr ffff8881056b9480 by task poc/798
   kfree+0x12f/0x4e0
   hash_ip4_resize+0x1268/0x18e0 [ip_set_hash_ip]
   call_ad+0x367/0x8e0 [ip_set]
  Allocated by task 798:
   ip_set_init_comment+0xbe/0x220 [ip_set]
   hash_ip4_add+0x19c7/0x22f0 [ip_set_hash_ip]

A replayed add can instead leave the copy holding the stale pointer,
because ip_set_init_comment() is skipped for kernel side adds since
commit a442c8a89fb9 ("netfilter: ipset: do not update comments from
kernel-side adds"), and the second free then happens at set destroy.

Destroy the extension on the old table only when the operation is not
queued for replay: the replacement table owns the element from the
replay on, and the old table is freed with ext_destroy == false.  An
element deleted before the copy loop reaches it is not copied, so its
comment is leaked instead of freed twice.

Fixes: f66ee0410b1c ("netfilter: ipset: Fix "INFO: rcu detected stall in hash_xxx" reports")
Cc: stable@kernel.org
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Signed-off-by: Jun Yang <junvyyang@tencent.com>
---
A KASAN reproducer for this issue is available if requested.

 net/netfilter/ipset/ip_set_hash_gen.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/net/netfilter/ipset/ip_set_hash_gen.h b/net/netfilter/ipset/ip_set_hash_gen.h
index 80ca523f304b..e84341ae9ab6 100644
--- a/net/netfilter/ipset/ip_set_hash_gen.h
+++ b/net/netfilter/ipset/ip_set_hash_gen.h
@@ -1068,7 +1068,11 @@ mtype_add(struct ip_set *set, void *value, const struct ip_set_ext *ext,
 		data = ahash_data(n, j, set->dsize);
 		if (!deleted) {
 			mtype_del_cidr_all(set, h, data);
-			ip_set_ext_destroy(set, data);
+			/* The resize copy shares this extension:
+			 * the replayed add destroys it.
+			 */
+			if (!(t->resizing && ext && ext->target))
+				ip_set_ext_destroy(set, data);
 			t->hregion[r].elements--;
 		}
 		goto copy_data;
@@ -1223,11 +1227,10 @@ mtype_del(struct ip_set *set, void *value, const struct ip_set_ext *ext,
 			smp_store_release(&n->pos, --pos);
 		t->hregion[r].elements--;
 		mtype_del_cidr_all(set, h, d);
-		ip_set_ext_destroy(set, data);
-
 		if (t->resizing && ext && ext->target) {
-			/* Resize is in process and kernel side del,
-			 * save values
+			/* Resize is in process and kernel side del, save
+			 * values.  The resize copy shares the extension:
+			 * the replayed del destroys it.
 			 */
 			x = kzalloc_obj(struct mtype_resize_ad, GFP_ATOMIC);
 			if (x) {
@@ -1236,6 +1239,8 @@ mtype_del(struct ip_set *set, void *value, const struct ip_set_ext *ext,
 				       sizeof(struct mtype_elem));
 				x->flags = flags;
 			}
+		} else {
+			ip_set_ext_destroy(set, data);
 		}
 		for (; i < pos; i++) {
 			if (!test_bit(i, n->used))

base-commit: 4d67cf2fd2352f130c42494a933ba9158b925c65
-- 
2.56.1
