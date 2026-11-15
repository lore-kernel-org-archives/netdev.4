Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745208;
	b=NeBhxYVoAUChnAlS+dwlFo7uqhb0l+VtnUB5yWt3fJZFk5PUdBPiFAzP1FutgkUFfpkK
	 W5g1OhvchfBY5eWI5bMmWgRP6wijIsYaX7knuVrytA/p2Dhb3+MZEzPEa0yw5qjnKxsoS
	 vbmtXH5V8XcSfTMZaPG501rGqCL2yqWGwASFPn9Tu9Djp3qgltaWXXRQVQvHT93P6L/lT
	 Jx5nb6Og4NvUqnOxBCg81duEl1PAHN99ELCGay6kU/fJcj0MxqpXDpDJ7Qp05w/ojJjgk
	 QJwQoDR7Z3IUax4i4hHohsbzETECDdvFcpZg36ifkKY6OYyrvBhYLw3CCjuZsq6X2kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wM9X+iy5MCRcwM8plfZFoLTKyrt2bxDseelvnwrZu18=;
	b=fkh2Izj8jAhr5v2ikk6T4oc7+yIBmbv3U2/L2dR5JzH+dps8/S9i0PbZiudRvO1aoyOZ
	 XYLg5UoB2zOjWPmv3apf8r3YhgCNoc2b6gMzV2SdgRvYKY+8TDdTm6p8hGLyKrRhtzSNs
	 60Ke8Sp5mIUS6ZpNL+0dTrPqi60iu6xCFai0akMaeaoWVNPMneXGKfSTXD+DNIEfBjZgu
	 n2kwR1bWbmanRkczEF3USQ04W8ptEdp1HHoT9/I93fc1SS0tUA9h2jEeIVxNtLMxJljSC
	 LhDsCWJOKFevqFTo8Zpgl9Uskn6HNiLrQ8cD5bHtbeJOsul3yRBtwT1Ca76K/TKiLCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cDsEstZO;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C9F606A31F
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 12:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08C9F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cDsEstZO
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so1176015a12.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 04:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794745207; x=1795350007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wM9X+iy5MCRcwM8plfZFoLTKyrt2bxDseelvnwrZu18=;
        b=cDsEstZOoe5RaS1REViHKZr2NgVH4fotMK9V+PtupwGYT1fpbaoX1x1RxwOSITj6qj
         fRESDpsU8di1FlyJ2Myd52Umw61gLdmoLDWAKeU+K0+4fQ2MqxlTZkEUJKkgsPirblng
         v5BoDba/fAAMq/XNPW4fJva4Yef6TxU/bWK3fVpUyMpH4ATHts4rLVXAs6MDoct1CN2y
         EzGAyndI3yrXug1nnKPbBfSeGFytlvgIYr/O4y2YZ/VS6Xfh8q+AX6b9hqOfvcbU8bpc
         97PJvjL2kXMun6tbduI02A6Icc1R9k+N4RBc3ArZKwFCO9A1FYVpU8sZc4LgAjYPDBNK
         pIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794745207; x=1795350007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wM9X+iy5MCRcwM8plfZFoLTKyrt2bxDseelvnwrZu18=;
        b=0JHsYxIRPpj2/YJ71baaczlKdIKeE76x/vZBV8HI6dj2DDhrloCjmiStC/8wmZ49qq
         XGg5lqIDq2EFyDNoMwvEGntapPEBLpXucxQmRTu/3sBe6WnVdZA0YC25toKv12B2syuO
         2rFspnOvEJDG3C5P4X0O1xR7zNkwW24ds1rcNRazUIvAtXKAvDD6PBvzFDOGxWIudhdA
         Iib1Jac8G1jzfP6sM4OeNDJ1qASQi0t+t3DvW7Dr8zhdwsCDZeuYSA4GAs2GQpD9JRel
         6b12vN0u6gmH21ACOtMVeeX2AvSPqUfs8RyBqqqXoWE+t1WyrTE4J/RTkhm3qaaRRZQr
         Hj+Q==
X-Forwarded-Encrypted: i=1; AL+hErEuveS8ifGBi9U+qSw/DAdPl+RiCBpNPTzfyn7P5cHJsmIQZ/hi5SUX+k+eRkt5UuLXCi+AU8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eVysYCacm4fnghGsMqRggHP9z9MF9a2LcQAWRC2cCd7CLB3Z8
	2cSQxauUFuKoqFkYQsnI6nR5rDblNd1IJsVpYdFJAeLiro30RpoiCqPk
X-Gm-Gg: AYBFou0jhFDT2VgHtZeOE09KmeLTHVaKIFS42Yq9xdeauzxpXLPK6opnse1Lajm7a4e
	4a6I6tu17NBFQwGWT+Q4yjIKFxzCid1YYvac5FY23aSENaIlkplAF7kiqFd4KubQtg2+sAOk85O
	Ve5djrDkD+KeP3eSvKT3ecI8jjpXALYUo8mCXSWa1ayc2mebXvuK74NT7fm8iluwHO1P6wuhb/C
	VThi+wKR7DtOb3yOXuq4mAV19w7AQiOXmq+PuK5k7ZiNEydNETfGP4tcKZNh5l4t71GRv+I2AEh
	56qOPILQVEr8ue3N+KOdeuwkKG4OGPRZVPUALxQKs/T3R3JLKFcdD6hQNmQcfcbSn2t/94MtOcf
	i5kplaTwrCFOpcSqr+Rvm/S/H2ocnt/vEkZXSm8mKm8vnEHPKZLP95l0JmEBp+f8M921EBXX9eq
	DS8YcuHWse7pmJOfSxT+PkV06wvrzNrz49IkvlTiz/LuLeI/24in0uEEoXEDjHz+lxcNH9taFKE
	zeYgiw/bsEoPSv5HAGlYJVyivmREN+CZpwQ1qVY/rGXz0VzS2JbkymnX+CHJfC8vU2Sli2X+8vD
	F0eDSNeAroBVCE+yLKHEy9SYZzYK/Y/WOOkhCwfkKqHGsebIQhoV3ADOPG1NZx6jbPBATCA/Q0R
	+Y1t3pxRJoc5LReJnzdkMy+ntINLZIQGz4L5BZgAIdWVcDsSkYa1G8svFg+NChknKRp917oN3/Q
	oxYw9hELTG+pr+X2yc/gOt+c749T8UmI+EiyTDEnUR7rsFA/UgIQX9gysYG9H6iEkiPXOwBCv5D
	3Pj2mX+0HwtUaWB/0nngrUUEq0ZTjHxzgYpIoB2mg6q4JGFxCAqF6BKqzh/NQg0
X-Received: by 2002:a17:90b:5105:b0:3ac:a5ff:2cc3 with SMTP id 98e67ed59e1d1-3b1b081ad46mr7535432a91.8.1794745207241;
        Sun, 15 Nov 2026 04:20:07 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm13828101a91.11.2026.11.15.04.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 04:20:06 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] rxrpc: Fix NULL deref on CHALLENGE to an unsecured client conn
Date: Sun, 15 Nov 2026 22:49:36 +1030
Message-Id: <20261115121936.5523-3-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
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

The I/O thread publishes a client connection in the local endpoint's ID
table, where incoming packets can find it, while it is still in
RXRPC_CONN_CLIENT_UNSECURED: the security class is set but
conn->security_ix is 0 and no session key is installed.  The key is set
up later by the sending thread, and if that thread is interrupted while
waiting for a channel the connection can stay unsecured indefinitely.

A CHALLENGE carrying securityIndex 0 then passes the check in
rxrpc_input_packet_on_conn(), and nothing before ->respond_to_challenge()
looks at the connection state.  rxkad encrypts the RESPONSE with a NULL
cipher and the work item oopses in fcrypt_pcbc_encrypt(); rxgk
dereferences a NULL transport key in rxgk_rekey() under
conn->security_lock.  An unprivileged local user can do this against
their own socket: the epoch is in every packet the client sends, and the
connection ID and state are in /proc/net/rxrpc/conns.

Discard a CHALLENGE that arrives on a connection still in
RXRPC_CONN_CLIENT_UNSECURED.  A genuine server cannot challenge before it
has seen DATA, and no DATA is sent until security is set up.  Read the
state under conn->state_lock to pair with
rxrpc_init_client_conn_security(), which installs the key before changing
the state under that lock.

Discovered by an AI code review agent, reproduced on unmodified mainline
with KASAN: a CHALLENGE with security index 0 sent to a connection listed
as ClUnsec in /proc/net/rxrpc/conns oopsed the rxrpc worker with "KASAN:
null-ptr-deref" in fcrypt_pcbc_encrypt().  Same on v6.12.117.  With this
patch the CHALLENGE is dropped and secured connections still answer
theirs.

Fixes: 9d35d880e0e4 ("rxrpc: Move client call connection to the I/O thread")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
---
Tested on mainline b3dfbde62cf1 in a 2-vCPU KVM guest with KASAN and
PROVE_LOCKING, AF_RXRPC and RXKAD built in, as an unprivileged user.
Unmodified, the rxrpc worker took a general protection fault with
"KASAN: null-ptr-deref" in fcrypt_pcbc_encrypt() from
rxkad_respond_to_challenge(), and the test process then did not exit
within 300 s.  With this patch there is no oops: the CHALLENGE to the
unsecured connection goes unanswered, and the secured connection answers
its own as before.  On v6.12.117 without debug options the unmodified
kernel gave "BUG: kernel NULL pointer dereference" in the same place.

Stable: the hunk applies wherever ->validate_challenge() and
rxrpc_post_challenge() exist, v6.16 and later.  6.12.y needs a backport:
there the CHALLENGE is validated and answered in the work item, so the
same locked test goes into the CHALLENGE arm of rxrpc_process_event()
and returns 0, as the RESPONSE arm below it already does.  6.6.y and
6.1.y were not examined.

Not tested: rxgk, the RXRPC_MANAGE_RESPONSE path, interoperation with
AFS servers or clients.

The test program is not included here; it is available on request.

 net/rxrpc/conn_event.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)
diff --git a/net/rxrpc/conn_event.c b/net/rxrpc/conn_event.c
index 611c790bc6d..da16521cdfb 100644
--- a/net/rxrpc/conn_event.c
+++ b/net/rxrpc/conn_event.c
@@ -511,6 +511,16 @@ bool rxrpc_input_conn_packet(struct rxrpc_connection *conn, struct sk_buff *skb)
 				rxrpc_send_conn_abort(conn);
 			return true;
 		}
+		/* No genuine peer can challenge before the client has sent
+		 * DATA, and until then there is no session key to respond
+		 * with.  Pairs with rxrpc_init_client_conn_security().
+		 */
+		spin_lock_irq(&conn->state_lock);
+		if (conn->state == RXRPC_CONN_CLIENT_UNSECURED) {
+			spin_unlock_irq(&conn->state_lock);
+			return true;
+		}
+		spin_unlock_irq(&conn->state_lock);
 		if (!conn->security->validate_challenge(conn, skb))
 			return false;
 		return rxrpc_post_challenge(conn, skb);
