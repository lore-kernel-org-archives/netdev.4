Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795531;
	b=pPrUhheXvBeVBXmv+bs68bBEY8CGt+vQzxjCnHtLsv3XaaT452jO2uYqFkWkEGVGnx40
	 Ql6/DzleWbmLVYWwpENiSXBEtU4qifH4Sg9NeuUlrqZEavt9veisk0i/MXlMWDWziZPze
	 OJud3ctVV4bTlLFGPNrmyLyAPK5KdJZN4YCN3tY0u/LJdUMyeoqxmmvfnsQkdRBgyX+lD
	 9psGprJUoeq10sMM01CLWVChhwFjSmxpHWKSdatJ/sUatcWGMXsBugFtqX4Z93ZaQ6Pd7
	 6dubEdq0uVkvLjWZnUHk/ef0wrngRozIzv7utjrcHgUf2yuIfD9EKDRKlSUp3hn/1vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=63ZG94W78ag2coJTgI+gJc6cB2nUkVv//WGB+8ATnpw=;
	b=rUmSCVcWqSR4q92lvZe5uOdYS9+4RyvjajiHJwfspo1C7OJ3JxEnrnd+Vzy0rIvQ+SIZ
	 v1ovGWUt7BeVSe9qau7cDtoVqsOVGNkNkxLGm4Uk2nBzmlkHYIr1T1d/oz0ijI2ZGCAS2
	 oOoP+jWZrWqYGkY481YviZVX6gBne8MZHp+oQRzYNShxiNYQmcA8WxEVtQdEcJZ/TCZAx
	 HUWXXwRocR2MShPOjxeyie9wYlWTNaq0uXducgiHfCyoa152KMMGc+hDR4kZU40iJY1Vs
	 XuvRJmx34+9I633NzGmyW5C3WmfYf67+Lc3VghegSfjGQLSEp+Qej5rl8T6WJlygJfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e2uG4pdn;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796A0606A336
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 796A0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e2uG4pdn
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so955650a91.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794795530; x=1795400330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=63ZG94W78ag2coJTgI+gJc6cB2nUkVv//WGB+8ATnpw=;
        b=e2uG4pdnrRdCXO9OvqoZS2Q0tB4SizaKOj/Hus245WkgMGr25iJnpCFoHPp31MejlZ
         YN65BLOH/esOyIM+dEpaEwu9qCVOd+J70riWJZURo970JlGYHcO/53CsUT7Rm0ywlDid
         WCkRX3AcW5kqU/UtB1PF85va5CqfEYajOx9iGfJ+SGup14QWfVC7AqzoQIE3RqvLSrWn
         N1aC+sEUF/7iYwRgpDP0NyG/9oVvKagI5tsifKfzz5eNJsaNNUUEy3ObJi1H+8C9uvwA
         A1br1trLPRmZfeIOi1jnPbetoHYOsbtITBKymVdqf8SsPqsNGWr/y2fYAKnXLpxyjwQp
         JI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795530; x=1795400330;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63ZG94W78ag2coJTgI+gJc6cB2nUkVv//WGB+8ATnpw=;
        b=iS20oavMfEelMYoDKLnQcmgnOa/MIjltfJQSMjLEJjJSYW0zRIiX50YNFFyntrV/X7
         Q+Tu6hXNk4mOn5BWH1eEmAplemZlFanbW8DCSBtzc/Muf7t/uOVULG5/r/m7eTv23Dfl
         cFMezuSzq7xPlARarSNTBqeFFUfdF9dggFHXtmUHHh4Fb8nrhhBXTG7KKhQi06soCvrU
         IiUyCDm50h+GlyFAZ9lWcg8lack+jMav9KhtJK36pwc2wD7wjjy/IDZIZ8Rgc19fvy+8
         hxYqjSj9NGK71jTjMseLXs5mv/2c5h8HvdwXD2dfZXdQqpWxgN6WnkVJzftGAwy3GrfB
         CidA==
X-Forwarded-Encrypted: i=1; AL+hErHwUlThMbuc0q08J002dT+lOHPgQ9MdoU5TvrSAbXhpKL1OqdQXm1qGIpDdsooM3NTUa7GuFAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2Q2KPj21986jawmo8yWHDbxg70GypZAvKq1zDRq2e98rjcNQa
	o6FW9rafKIE/taXKACwe1xRfPzaJog4XMCK8Cn3fR6CeaTB1bjAtNmAKXlyCgALO3RFCdQoizxG
	huUHTNg==
X-Received: from pjbbp15.prod.google.com ([2002:a17:90b:c0f:b0:3b1:9e49:256b])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b01:b0:3ab:2d46:1dd6
 with SMTP id 98e67ed59e1d1-3b1b087a23amr9245532a91.4.1794795529755; Sun, 15
 Nov 2026 18:18:49 -0800 (PST)
Date: Mon, 16 Nov 2026 02:18:19 +0000
In-Reply-To: <20261116021845.2533130-1-kuniyu@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116021845.2533130-1-kuniyu@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116021845.2533130-3-kuniyu@google.com>
Subject: [PATCH v1 net-next 2/4] selftests: bpf: sockmap: Remove AF_UNIX
 MSG_OOB test case.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, 
	John Fastabend <john.fastabend@gmail.com>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We will drop MSG_OOB support from AF_UNIX.

Let's remove the test case from sockmap_redir.

Note that struct socket_spec.send_flags is no longer used so
removed too.

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: Jakub Sitnicki <jakub@cloudflare.com>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org
---
 .../selftests/bpf/prog_tests/sockmap_redir.c  | 45 +++++--------------
 1 file changed, 11 insertions(+), 34 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_redir.c b/tools=
/testing/selftests/bpf/prog_tests/sockmap_redir.c
index 9c461d93113d..e73d3a674a74 100644
--- a/tools/testing/selftests/bpf/prog_tests/sockmap_redir.c
+++ b/tools/testing/selftests/bpf/prog_tests/sockmap_redir.c
@@ -103,7 +103,6 @@ struct redir_spec {
 struct socket_spec {
 	int family;
 	int sotype;
-	int send_flags;
 	int in[2];
 	int out[2];
 };
@@ -197,12 +196,12 @@ static void handle_unsupported(int sd_send, int sd_pe=
er, int sd_in, int sd_out,
 		try_recv("bpf.recv(sd_recv)", sd_recv, MSG_DONTWAIT, false);
 }
=20
-static void test_send_redir_recv(int sd_send, int send_flags, int sd_peer,
+static void test_send_redir_recv(int sd_send, int sd_peer,
 				 int sd_in, int sd_out, int sd_recv,
 				 struct maps *maps, int status)
 {
 	unsigned int drop, pass;
-	char *send_buf =3D "ab";
+	char *send_buf =3D "a";
 	char recv_buf =3D '\0';
 	ssize_t n, len =3D 1;
=20
@@ -217,10 +216,7 @@ static void test_send_redir_recv(int sd_send, int send=
_flags, int sd_peer,
 	if (xbpf_map_update_elem(maps->out, &u32(0), &u64(sd_out), BPF_NOEXIST))
 		goto del_in;
=20
-	/* Last byte is OOB data when send_flags has MSG_OOB bit set */
-	if (send_flags & MSG_OOB)
-		len++;
-	n =3D send(sd_send, send_buf, len, send_flags);
+	n =3D send(sd_send, send_buf, len, 0);
 	if (n >=3D 0 && n < len)
 		FAIL("incomplete send");
 	if (n < 0) {
@@ -255,20 +251,6 @@ static void test_send_redir_recv(int sd_send, int send=
_flags, int sd_peer,
 	if (recv_buf !=3D send_buf[0])
 		FAIL("recv(): payload check, %02x !=3D %02x", recv_buf, send_buf[0]);
=20
-	if (send_flags & MSG_OOB) {
-		/* Fail reading OOB while in sockmap */
-		try_recv("bpf.recv(sd_out, MSG_OOB)", sd_out,
-			 MSG_OOB | MSG_DONTWAIT, false);
-
-		/* Remove sd_out from sockmap */
-		xbpf_map_delete_elem(maps->out, &u32(0));
-
-		/* Check that OOB was dropped on redirect */
-		try_recv("recv(sd_out, MSG_OOB)", sd_out,
-			 MSG_OOB | MSG_DONTWAIT, false);
-
-		goto del_in;
-	}
 out:
 	xbpf_map_delete_elem(maps->out, &u32(0));
 del_in:
@@ -328,7 +310,7 @@ static void test_socket(enum bpf_map_type type, struct =
redir_spec *redir,
 			struct maps *maps, struct socket_spec *s_in,
 			struct socket_spec *s_out)
 {
-	int fd_in, fd_out, fd_send, fd_peer, fd_recv, flags, status;
+	int fd_in, fd_out, fd_send, fd_peer, fd_recv, status;
 	const char *in_str, *out_str;
 	char s[MAX_TEST_NAME];
=20
@@ -337,26 +319,24 @@ static void test_socket(enum bpf_map_type type, struc=
t redir_spec *redir,
 	fd_send =3D s_in->in[redir->idx_send];
 	fd_peer =3D s_in->in[redir->idx_send ^ 1];
 	fd_recv =3D s_out->out[redir->idx_recv];
-	flags =3D s_in->send_flags;
=20
 	in_str =3D socket_kind_to_str(fd_in);
 	out_str =3D socket_kind_to_str(fd_out);
 	status =3D get_support_status(redir->prog_type, in_str, out_str);
=20
 	snprintf(s, sizeof(s),
-		 "%-4s %-17s %-5s %s %-5s%6s",
-		 /* hash sk_skb-to-ingress u_str =E2=86=92 v_str (OOB) */
+		 "%-4s %-17s %-5s %s %-5s",
+		 /* hash sk_skb-to-ingress u_str =E2=86=92 v_str */
 		 type =3D=3D BPF_MAP_TYPE_SOCKMAP ? "map" : "hash",
 		 redir->name,
 		 in_str,
 		 status & SUPPORTED ? "=E2=86=92" : " ",
-		 out_str,
-		 (flags & MSG_OOB) ? "(OOB)" : "");
+		 out_str);
=20
 	if (!test__start_subtest(s))
 		return;
=20
-	test_send_redir_recv(fd_send, flags, fd_peer, fd_in, fd_out, fd_recv,
+	test_send_redir_recv(fd_send, fd_peer, fd_in, fd_out, fd_recv,
 			     maps, status);
 }
=20
@@ -365,12 +345,10 @@ static void test_redir(enum bpf_map_type type, struct=
 redir_spec *redir,
 {
 	struct socket_spec *s, sockets[] =3D {
 		{ AF_INET, SOCK_STREAM },
-		// { AF_INET, SOCK_STREAM, MSG_OOB }, /* Known to be broken */
 		{ AF_INET6, SOCK_STREAM },
 		{ AF_INET, SOCK_DGRAM },
 		{ AF_INET6, SOCK_DGRAM },
 		{ AF_UNIX, SOCK_STREAM },
-		{ AF_UNIX, SOCK_STREAM, MSG_OOB },
 		{ AF_UNIX, SOCK_DGRAM },
 		// { AF_UNIX, SOCK_SEQPACKET},	/* Unsupported BPF_MAP_UPDATE_ELEM */
 		{ AF_VSOCK, SOCK_STREAM },
@@ -392,10 +370,9 @@ static void test_redir(enum bpf_map_type type, struct =
redir_spec *redir,
 			struct socket_spec *out =3D &sockets[j];
 			struct socket_spec *in =3D &sockets[i];
=20
-			/* Skip intra-proto and between variants */
-			if (out->send_flags ||
-			    (in->family =3D=3D out->family &&
-			     in->sotype =3D=3D out->sotype))
+			/* Skip intra-proto */
+			if (in->family =3D=3D out->family &&
+			    in->sotype =3D=3D out->sotype)
 				continue;
=20
 			test_socket(type, redir, maps, in, out);
--=20
2.56.0.611.g1030f0b940-goog

