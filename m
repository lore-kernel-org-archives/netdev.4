Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415926;
	b=XKcjurajDzkB9q2SRG1pGvZna0l3eVkWoFra6VppuxRQFg3B+Wat27dT7DgJ060JGHDu
	 m+eZfeM88utw8gWMAGQi8/aBCFyHouuzcxx5ugYqdQ1dE7zBSh1BlHZyqf0CE1BUcVzll
	 3mAcZBM2RDnHacgKLbIb1CINnOikimA/lgYe6FQhYo97B4KmWE0udEzwYk4o1itWg1llX
	 Y8yI/k/Ol117ZaSW/2qeygF8Gxw/SMvHnRfzJDBP7dFvEOvTGbKS3i+yU55Sp9AJKlBEO
	 V+EthFFHtUpPohBzHPQGoXkY6MWSoRZqYMCJCb0xHjI09724/GHU74qSHqaVx2WMMkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NVD2K+hzT//oEG10ivggwaDCvEUpG9RqeSyqEh6apek=;
	b=5Le5aqfCKB4xI0IZCkcE2ObYAk0HuL420wwK5QnS6ymn26hBlzFLfnEwhyZcTPNVJF/a
	 alzjgksjnDsZgxf/OJR+IIKFEZsL9KmiFMyUOR/KgoDKqMx5BfndH+wIBOrLoUpmIcOFV
	 /VmsQI09k8bTF56R7qNDXkjHGH8u8BPQYfiXrDHYxTfp6TgZuxfD+ZPAqef0NgJV01bQv
	 d3jjPimVYf6mbC/AFC82Cn/D94OcazzBtY7WntsfScMkWbm6lJEA6SKkQKZk/s/3P51/G
	 l6nzYl6UX6/O+ayLS9v77KCUIOOQGkL31ax6z2UaY/YZeRSUNrsdafPhmQqUwXYXICw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkksMU8f;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B389606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B389606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkksMU8f
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eafb65e169so1791145e0c.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 22:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795415925; x=1796020725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NVD2K+hzT//oEG10ivggwaDCvEUpG9RqeSyqEh6apek=;
        b=fkksMU8fAc+yqUoyWh6UZIACw679gqlS/C06qNo/BJOrb9yO8zMFLP3pH6lSr8OzEr
         8NQanRaXVIszQU54moh8JIFe6/3kSi5GMNopXMQqXEHMf8Y7i2b2R+Z6/jerAFUa7Ewq
         IHRSMgjWg1dolorsttwxt/7zbcqS5zuMd3mhUXqFwd6UltrEaQg4nksxtVqSwdpgJ5GK
         Z5e9IywPqwuKLHVUJw2kpJ/TpQVpQuz+CSopnYGsNaT1K2QRpxb78rJDeSgeqkRXp+0C
         JjSIISsdV6zTFT737bPIfU9+sur19yUaIGYoI64FkVi5StEZ1nSV7JfG57+7kctH+9od
         Cflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415925; x=1796020725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVD2K+hzT//oEG10ivggwaDCvEUpG9RqeSyqEh6apek=;
        b=lob73EbVTtFqxsRPX1euZto3c3B6Pk92fgGlSvuSvUuwtj+jvzYO/ehNhgjpxvM3Pp
         QSD8oD2Iw8kuxO+qSwshW1UvMPmrO41gOyp1yuh6zcyKqG4sKpHvfmCITIMIX+xySD6/
         R3JYEfoPH8AbN8XwXcVNACFO104JSfQa2wJ3B4bTylFW7qEtJ/fEL5rWXTuy4i8iHzm5
         PVV8OgfVA24xS9SsPOtfVxfumiU15TZlNvQ9fvYHeRx6mWp2Rl6tNOIQ9WYMqBN8fC5+
         CmfMS8ltHrKAIyyefzr7R+1x2HY1pzU2h6P5rHeyCCBFDS2R5kBaRyUS1qcrZE45xkbF
         GVow==
X-Gm-Message-State: APuU4Z9FTQK3cM+A3ZAkJUVHFpLXVLhI/4gixeNUsOUo0/Qhg+zKE51v
	P6RxBqdEjM7H8KNo36ughYlyZlrZT4OeKfBLXVI/43y8gRhvUc7oEiBnxneipr4Ly5M=
X-Gm-Gg: AZFdTZe6STI++RLVgOh1K4jIwSCQ3gY8f5mIdXSb6QKmjvdC2W4pJL2nF1/cRjbOMM/
	/yYmj10dS4WiUUc5I0/oTFJj+uGKGilQH2zJ7tSB/a07/rIO2fngOUEjfcUxqk6rAwT5f/XQrwa
	uUsGO+RhLqSsF3Si8kMY7IpQn4Xwub4D84iuO6TP8aCKq3conTGXfOwYYe/my0MjUaK76oXgLU6
	m3ilebdMA2zLuukNUEKFs06N7M9U8/jAw2ilhv6maw8cqclnjI9tZleStxI974maUWsSUfAOirn
	mifI/wiEbq91CB5DW4//WievepoRf5aKwwN4c17qflwt4SmMxCXV4I4w2Od/NACCXroMHJLyQFg
	J9LpeGiGQQTjI/9p0mOKdXG/DWI9cox7gKYq/7fv8SQ2QihOwVs/j3vVfYretWtElWt2fJh11j7
	9qzT0TvN08t5TjncKEa7Bk22eFGgBwutcUZEifOKm/8u9pRi7txqg0choT7842ho7Yo+oTS0+cc
	taIsa8E9nfjuX6Uu9dQPw0E63XxuBxKnmWzEAqYDXRfCosU+oK/52yMKzMEIISfWM1EDEeK/ZAh
	fs2y5LpG3qUocx9JWlmLCIrEhS1GtCWp8BUV2UX8g/Eqc6PospOz6u3ukvBBVI+0r4DTun4SNkZ
	U3Q7yFxtprPDy
X-Received: by 2002:a05:6122:1d0c:b0:5ea:b991:d489 with SMTP id 71dfb90a1353d-5ee8aed6f75mr5307099e0c.13.1795415924871;
        Sun, 22 Nov 2026 22:38:44 -0800 (PST)
Received: from MacBook-Air-91.lan ([2603:9000:d440:53a:10be:9c04:cd21:d4ba])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b4335e1sm9994665e0c.1.2026.11.22.22.38.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 22:38:43 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: netdev@vger.kernel.org
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	linux-kernel@vger.kernel.org,
	Juan Agustin Niccolini <juanagusnicco@gmail.com>,
	Eddy Tsalolikhin <eddsterxyz@gmail.com>,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH net] tls: set the copy cursor before cloning plaintext
Date: Mon, 23 Nov 2026 01:38:42 -0500
Message-ID: <20261123063842.64536-1-juanagusnicco@gmail.com>
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

tls_sw_sendmsg_locked() copies into the open record by cloning space
with tls_clone_plaintext_msg() and filling it with
sk_msg_memcopy_from_iter(), which starts at sg.curr and sg.copybreak
as left by whatever last added to the record. The copy trusts other
paths to leave that cursor in the right state, and they have not.

Since commit d829e9c4112b ("tls: convert to generic sk_msg interface"),
the path that adds the caller's own pages (sendpage, later splice) did
not move sg.curr, so the next copy wrote into those pages. Commit
c5a595000e26 ("net: tls, update curr on splice as well") fixed that by
making the splice path leave sg.curr at sg.end with copybreak 0. That
is only correct if the clone adds a new element. sk_msg_clone() instead
grows the last element when the cloned range is contiguous with it, so
sg.end does not move, and the copy starts at an unused slot, wraps
around the ring and writes from sg.start, into the spliced pages again.

The spliced pages can be page cache pages of a file the caller opened
read-only, so an unprivileged user can change the cached contents of a
file it cannot write.

The copy path always appends after the data already in the record, so
set the cursor there before cloning: on the last element with copybreak
at its length, or at sg.start when the record is empty, as
sk_msg_reset_curr() does. That holds whether the clone grows the last
element or adds a new one, and it covers every path that adds to the
record, whatever state it left the cursor in.

This is where the cursor should have been set all along. With it set
here, the copy never depended on the splice path moving sg.curr, so
neither the original bug nor the one introduced by its fix would
have existed.

I found this bug during an LLM-based audit. Kyle Zeng and Eddy
Tsalolikhin independently reported it before and are credited below.

Fixes: d829e9c4112b ("tls: convert to generic sk_msg interface")
Fixes: c5a595000e26 ("net: tls, update curr on splice as well")
Reported-by: Eddy Tsalolikhin <eddsterxyz@gmail.com>
Reported-by: Kyle Zeng <kylebot@openai.com>
Closes: https://lore.kernel.org/all/20261030042138.73739-1-kylebot@openai.com/
Cc: stable@vger.kernel.org
Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
Jiayuan Chen posted "[PATCH net v1] tls: fix ring wrap in
sk_msg_memcopy_from_iter() after splice"
(https://lore.kernel.org/all/20261120225720.89044-1-jiayuan.chen@linux.dev/),
which sets the same cursor in the splice path. The two patches touch
different functions and apply in either order, and this one is still
needed even if his goes in: his closes the splice route on mainline,
but not tls_sw_do_sendpage() on 6.1, 5.15 and 5.10, where it does not
apply, nor the record split on 7.1 and older. This patch removes the
copy's dependence on all of them, and applies unchanged to every
stable branch, because tls_clone_plaintext_msg() is the same everywhere.

I have an exploit that lets an unprivileged process overwrite the page
cache of /bin/su to open a root shell. I confirmed it works on mainline
and 5 distros. It is available to the maintainers on request.

On 6.1, 5.15 and 5.10 the bug is a race, but an unprivileged user
won it within a second in my tests. I have another reproducer
available for those.

I used a fuzzer with a page cache oracle to confirm this patch fixes
the issue in QEMU guests on mainline 7e1392a42ea2, and all stable branches:
7.3.5, 7.1.13, 6.18.64, 6.12.118, 6.6.162, 6.1.192, 5.15.225, and 5.10.274.

I also confirmed that it fixes the original bug on a kernel
without c5a595000e26 applied.

 net/tls/tls_sw.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 226e0f176fdc..efff7a02aef2 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -349,6 +349,17 @@ static int tls_clone_plaintext_msg(struct sock *sk, int required)
 	 */
 	skip = prot->prepend_size + msg_pl->sg.size;
 
+	if (msg_pl->sg.size) {
+		u32 i = msg_pl->sg.end;
+
+		sk_msg_iter_var_prev(i);
+		msg_pl->sg.curr = i;
+		msg_pl->sg.copybreak = msg_pl->sg.data[i].length;
+	} else {
+		msg_pl->sg.curr = msg_pl->sg.start;
+		msg_pl->sg.copybreak = 0;
+	}
+
 	return sk_msg_clone(sk, msg_pl, msg_en, skip, len);
 }
 

base-commit: af6737b9066832a2017c281159950ba92385ce00
--
2.53.0

