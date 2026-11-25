Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596265;
	b=2d8jerZFctQhVTAx7zJraiyBHv1mXpUQyoKBOAaM3d0SYKeEnnq29kf1qkv78Raw449o
	 Ef3TbeZD4TZW62f7evgxSItpwB9pVCys5TyE5n47EzZsAkF3iXd71WSb15ffSXRnEehPJ
	 J2BwJZiceLQJP1vulOljWt1XmddAUAanYozDNQvRPiTyxdZ7cMyY/SYVni0CZnxw2RkIk
	 IrNar1ONHIIWair8b1DOYXBF9ais5dsqIlTY9e4JMZvVn1WRj0r62VLfk1xGo6IB/EC/7
	 ocpP/y2KoHCNMHlfXyljNdkuZy3xS1TfAi07JfzrJ6Xo7tlY3UyGYO+KIAM24FNb+cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lPFYialRWG4pRS4OT1uh519VBoCu1VzItcljyeAUzHU=;
	b=SfUuk+DyECVbMdeNgKnWnaNTV2bcbgF7B/eJpgyj+ewDjnkUMyIAd0UVQYx7/KWaygYU
	 N/bvDqWQbp8PL5BeRsL2QFXujtEpiZg8ZC6alnyMsvDTLHG2OkvQqp9mwU38e7baspydO
	 f6oE/7wS9JlNboCMGOWImC1kK0UTLVLK02gt+4ryUqgvJrKJE8hFjX+gbAaSCBx+kv5xF
	 XmBjzJBz4oaVMaJUjPXi2tJkTULNfjRGKY/3wpgWyD5hG2ammmZ3EjY+BFMJeW24WnEgk
	 tQ3/M2YweePYeTugHrq6PYuIlyJwtgs70U/qegT8BnT4eD9xQGu3kw8PEy5dq4141dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvniTco1;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90EE606A32E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90EE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvniTco1
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f0918f9e6cso13332625ad.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596264; x=1796201064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPFYialRWG4pRS4OT1uh519VBoCu1VzItcljyeAUzHU=;
        b=SvniTco1NUSUtvFcoYZ0pgwBrsTVcjU87S1hUrTrJyFmUsyENhoIOScLvhwMGkbLuL
         crXEPfrkxUMG2y8MsFu3xB5AFPvmCIE9b0hx05ZepVsUWe3XH+F5bNHrwacvZuxswKux
         SPDw4FzfkycSozQxoisv3hb11k4/iqsEXBqs8xjqwbNw4x/0W9CZQCTXmCeVD+eRxCCG
         LbhpvGxuoAMlKVfZ4hIiHvjQL13hA8gGIew0cezJbNolZcFlAhOfy0qHWJhJkG285vpA
         ev4FMA+eP50cNFVfQMgJBk7OVG6NSG34uDJoQLSj3uaTLrF+KV8Djus0iMd+Go73+heL
         uVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596264; x=1796201064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPFYialRWG4pRS4OT1uh519VBoCu1VzItcljyeAUzHU=;
        b=G3Gk6drTXTN/PeoHMHSnULYBXxOz9A7YjbFbDmimJOHNIo2WR3A8xIWVfSE+/vR2ER
         NNLCDwwLx9EWteHx4+qWR4kK3DAxBqwEoqwVQtM2c3l8KwLRPq6crvbIeM2f5I5Qci6F
         W82gw01AkIBwdawpliRC/lWXCUYU3xbeJk8Za5RtTxBnlADYOWfLgOZEK+vfpZDUCC77
         d/6zddketDgZzkGTo7AadLIVdlhFmsx4EaeFJ5/gTc0CDHXgU/6iXgWf1Y0hFaUcLywZ
         BPZv/xT/EOoSPBfmL55qR3i/Xag3p226sqcfysWTP/Liqwg8byjV+103Jpa1TMoWTv9z
         LJRg==
X-Forwarded-Encrypted: i=1; AL+hErHxT0VhtDzG1wA0CUCvLcDodidT6KeUMdghDQ50Vi5wZZdpOCnepShEJZtO3lAWWuDY6a8hOqE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qi+GvS1VJoDm6otvj7DUrHczOYrHtO0bUw0H8zw0mIECTAKvV
	Rna/G39z2SzsfDdl9VTcNompzAEOroOwefXFTD1w5qLTDwxr11mwRhkR
X-Gm-Gg: AZFdTZe27gvuQw1MgU1KXmUXjsxtEYKDNI4yPQEhnJTTSEA+NBGubjWpsCONREymlFA
	7Z8iBiVVquzNR1c/FpFka5o2Ygv++L6BAoM/zS2Y9TAvU/D7+1rR0KgUJVzE073ws5Iih7EKnpQ
	QzgcBpM/xcVupuREQvVbSdwNsCB69IZX616Oarw9YT7vw27KC8B5RvnbS6l4nNDKXSU29RLlgAt
	AxkpCSOV5kUnXHnJFI4g8oJjVHS0zDOTyl0A2JePNvqMfFZZdVJbCBveG5satDqENkpR4LKm7Qi
	yyqSqEBdQEfzvPwx1w39ANjpqpc4yeDetMkiF4KNnKhap/SH+o/4tMTjsfF0VPvfZLq2EAqu5/O
	A4QIz4cUHExY5mqeGh3Hn1uBLxShcla/SIlIDEE7p2WFiERA82PsMprpE7Z4D9Z7bWB9AtSDGvx
	hBmC8L22YSEOTqIjsag/mbsEPaNEDyo9bw7eAYZh7UydXdkyyVfurGSnopD3N/eJ1byVDDUUSRc
	TzEuE6XzxsEjC3OatNMae7FxdEWVBRIk7WGc6TwVjT65VLo/UFD6YDPC7uxrKKhKs/y0CWGXI2e
	N5Q1zvGZEnZ2oT5Z5A1MAd39Q7NVyCP8WWv0HZB+mufi+FwCONlQql2CAtHMvSqvVv9M/yutXpp
	/2Rfvf0IZOI8Qr4topXiiy87jx3IF1RnGK14bPXV6
X-Received: by 2002:a17:902:ea0c:b0:2f0:3123:899c with SMTP id d9443c01a7336-2f03f0c1f37mr159122655ad.5.1795596263959;
        Wed, 25 Nov 2026 00:44:23 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad3:119::1c:2e7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a8asm81877485ad.24.2026.11.25.00.44.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 00:44:23 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhiqi Zhang <zhiqizhangg@gmail.com>
Subject: [PATCH v2] selftests: netfilter: fix nft_nat_zones.sh diagnostics
Date: Wed, 25 Nov 2026 16:44:16 +0800
Message-ID: <20261125084416.23282-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124071926.8818-1-zhiqizhangg@gmail.com>
References: <20261124071926.8818-1-zhiqizhangg@gmail.com>
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

nft_nat_zones.sh starts all client pings in the background and then
uses a bare wait to collect them. In bash, wait with no arguments
returns zero after all known children have been waited for, so a ping
failure does not set ret. The diagnostic after that wait is also outside
the client loop, so it would name only the final client even if it ran.

Store each ping PID and wait for it next to the matching client
namespace. This makes failed pings set ret and reports the client that
actually failed.

The veth0 ICMP counter mismatch path checks the 10.3.0.99 key but dumps
10.3.99 for debugging. Dump the same key that was checked.

OpenAI Codex helped analyze the Sashiko review and draft this respin. I
reviewed the changes.

Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
Changes in v2:
- Track each ping PID and wait per client instead of adding echo after a
  bare wait.
- Report the client whose ping failed instead of reusing the final loop
  value.
- Fix the veth0 ICMP debug dump key from 10.3.99 to 10.3.0.99.

 .../selftests/net/netfilter/nft_nat_zones.sh        | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/netfilter/nft_nat_zones.sh b/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
index d935c967dd..9397f09d0c 100755
--- a/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
+++ b/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
@@ -167,11 +167,16 @@ ip netns exec "$gw" sysctl -q net.ipv6.fwmark_reflect=1 > /dev/null
 for i in $(seq 1 "$maxclients"); do
   cl=$(eval echo \$cl"$i")
   ip netns exec "$cl" ping -i 0.5 -q -c 3 10.3.0.99 > /dev/null 2>&1 &
+  ping_pids[$i]=$!
 done
 
-wait || ret=1
-
-[ "$ret" -ne 0 ] && "FAIL: Ping failure from $cl" 1>&2
+for i in $(seq 1 "$maxclients"); do
+  cl=$(eval echo \$cl"$i")
+  if ! wait "${ping_pids[$i]}"; then
+    ret=1
+    echo "FAIL: Ping failure from $cl" 1>&2
+  fi
+done
 
 for i in $(seq 1 "$maxclients"); do
    if ! ip netns exec "$gw" nft get element inet raw inicmp "{ 10.1.0.3 . \"veth$i\" . 10.3.0.99 }" | grep -q "{ 10.1.0.3 . \"veth$i\" . 10.3.0.99 counter packets 3 bytes 252 }"; then
@@ -185,7 +190,7 @@ done
 if ! ip netns exec "$gw" nft get element inet raw inicmp "{ 10.3.0.99 . \"veth0\" . 10.3.0.1 }" | grep -q "{ 10.3.0.99 . \"veth0\" . 10.3.0.1 counter packets $((3 * maxclients)) bytes $((252 * maxclients)) }"; then
     ret=1
     echo "FAIL: counter icmp mismatch for veth0: { 10.3.0.99 . \"veth0\" . 10.3.0.1 counter packets $((3 * maxclients)) bytes $((252 * maxclients)) }"
-    ip netns exec "$gw" nft get element inet raw inicmp "{ 10.3.99 . \"veth0\" . 10.3.0.1 }" 1>&2
+    ip netns exec "$gw" nft get element inet raw inicmp "{ 10.3.0.99 . \"veth0\" . 10.3.0.1 }" 1>&2
 fi
 
 if [ $ret -eq 0 ]; then
-- 
2.54.0 (Apple Git-157)

