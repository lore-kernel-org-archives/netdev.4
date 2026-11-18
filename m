Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968617;
	b=ylrb+xnTg7AAxMn0IpeWeXeqFhZKdqjTohCf7GnB1LvVBXoqa9t3egOcY3yoNUQeXTUB
	 dwhCatUPOivfunLNiAUxQaFwgdYvA/AuJdPP6zN/0y3YwzSKovx49YknmjyML6dDZJGwt
	 onEBci9yyijIWARwqXoN3tvGzWh37dE910kUjxdNUPpYqs72glZ1CBVORgj4Tcfp7aHjD
	 JXazIN6MxFwdzX5x0jYStOBNxH7udE2ROJPD5D8/cObmpHGnU0hfkC2WcjcLp7DUV8AYt
	 5bcc+Cw6+ladeAV1mTZV3tk40zjx48yxCJvhIjY86CFQ6JHcmieNL0KXSU1V5WVpE7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968617;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6oNqjfLwODNPrytWKrh1Js8D4CY4QcBt5sW87Tc2t+8=;
	b=aB0yKfoTAz+Ax0a9jgRU4P0V/FoNBoTKmL/NjbgxBgV24gU30oRFSOOugKcFZN5iT3da
	 papnPakwHZbZeAFc9+9/DiwK3GdswpCB3d9GwtAJ7gpFQodSlBXyYlA7QHcqbyy+Hq7Ej
	 x79fmYN68GffHzbkIdWO6thHz7SrCo6qnKxyR8BQvtIpNF4+wFxJwNf8nUqMm9R3BP3mz
	 BdJQTZhRGhy0v7fI6Mi1Hykyu9CrqPZcQN03nQeFSvXvsCTslsCGHeUUsXYlKX4dGmUG6
	 kInF6dEcRuIS311rGee9PAyMEbbOZN7sFO4mHbiErdVcM0iXSOxqeJbFyubRTCjaigg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YDOZVvpP;
	arc=none smtp.remote-ip=95.215.58.81
Received: from mta1.migadu.com (out-81.mta1.migadu.com [95.215.58.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58154606A338
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58154606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YDOZVvpP
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3ZppDzIWuXdj81QZYLsjJrSKg5CXj2xIdvLnjy8LwOM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794968614; v=1; x=1795573414;
 b=YDOZVvpPi3+Mk0qgCU0tetvbb9lsBoOBM8BMn5q0PszN6qmDorKA6ME4guzMmCeW+oI340UB
 1hLHtBdzR/VXJ3xFpR+9nk5yV29ok/jNOOeceyXMSn65MSxi0N2D2uBZg/dKz3gjsYbF8cwONzB
 WC9dWpH8mM1/3xdt5a0W3leU=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 20ac36be495580ce;
	Wed, 18 Nov 2026 02:23:34 +0000
X-Mizu-Trace-ID: 20ac36be495580ce
X-Migadu-Flow: FLOW_OUT
Message-ID: <1e935f2f-5cbe-43ac-8d3e-a22d3b60f43e@linux.dev>
Date: Wed, 18 Nov 2026 10:23:27 +0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 net-next 2/4] selftests: bpf: sockmap: Remove AF_UNIX
 MSG_OOB test case.
To: Kuniyuki Iwashima <kuniyu@google.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuni1840@gmail.com>,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Jakub Sitnicki <jakub@cloudflare.com>, Jiayuan Chen
 <jiayuan.chen@linux.dev>, bpf@vger.kernel.org
References: <20261116021845.2533130-1-kuniyu@google.com>
 <20261116021845.2533130-3-kuniyu@google.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261116021845.2533130-3-kuniyu@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/16/26 10:18 AM, Kuniyuki Iwashima wrote:
> We will drop MSG_OOB support from AF_UNIX.
>
> Let's remove the test case from sockmap_redir.
>
> Note that struct socket_spec.send_flags is no longer used so
> removed too.
>
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>



Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>


> ---
> Cc: John Fastabend <john.fastabend@gmail.com>
> Cc: Jakub Sitnicki <jakub@cloudflare.com>
> Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
> Cc: bpf@vger.kernel.org
> ---
>  .../selftests/bpf/prog_tests/sockmap_redir.c  | 45 +++++--------------
>  1 file changed, 11 insertions(+), 34 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_redir.c b/tools/testing/selftests/bpf/prog_tests/sockmap_redir.c
> index 9c461d93113d..e73d3a674a74 100644
> --- a/tools/testing/selftests/bpf/prog_tests/sockmap_redir.c
> +++ b/tools/testing/selftests/bpf/prog_tests/sockmap_redir.c
> @@ -103,7 +103,6 @@ struct redir_spec {
>  struct socket_spec {
>  	int family;
>  	int sotype;
> -	int send_flags;
>  	int in[2];
>  	int out[2];
>  };
> @@ -197,12 +196,12 @@ static void handle_unsupported(int sd_send, int sd_peer, int sd_in, int sd_out,
>  		try_recv("bpf.recv(sd_recv)", sd_recv, MSG_DONTWAIT, false);
>  }
>  
> -static void test_send_redir_recv(int sd_send, int send_flags, int sd_peer,
> +static void test_send_redir_recv(int sd_send, int sd_peer,
>  				 int sd_in, int sd_out, int sd_recv,
>  				 struct maps *maps, int status)
>  {
>  	unsigned int drop, pass;
> -	char *send_buf = "ab";
> +	char *send_buf = "a";
>  	char recv_buf = '\0';
>  	ssize_t n, len = 1;
>  
> @@ -217,10 +216,7 @@ static void test_send_redir_recv(int sd_send, int send_flags, int sd_peer,
>  	if (xbpf_map_update_elem(maps->out, &u32(0), &u64(sd_out), BPF_NOEXIST))
>  		goto del_in;
>  
> -	/* Last byte is OOB data when send_flags has MSG_OOB bit set */
> -	if (send_flags & MSG_OOB)
> -		len++;
> -	n = send(sd_send, send_buf, len, send_flags);
> +	n = send(sd_send, send_buf, len, 0);
>  	if (n >= 0 && n < len)
>  		FAIL("incomplete send");
>  	if (n < 0) {
> @@ -255,20 +251,6 @@ static void test_send_redir_recv(int sd_send, int send_flags, int sd_peer,
>  	if (recv_buf != send_buf[0])
>  		FAIL("recv(): payload check, %02x != %02x", recv_buf, send_buf[0]);
>  
> -	if (send_flags & MSG_OOB) {
> -		/* Fail reading OOB while in sockmap */
> -		try_recv("bpf.recv(sd_out, MSG_OOB)", sd_out,
> -			 MSG_OOB | MSG_DONTWAIT, false);
> -
> -		/* Remove sd_out from sockmap */
> -		xbpf_map_delete_elem(maps->out, &u32(0));
> -
> -		/* Check that OOB was dropped on redirect */
> -		try_recv("recv(sd_out, MSG_OOB)", sd_out,
> -			 MSG_OOB | MSG_DONTWAIT, false);
> -
> -		goto del_in;
> -	}
>  out:
>  	xbpf_map_delete_elem(maps->out, &u32(0));
>  del_in:
> @@ -328,7 +310,7 @@ static void test_socket(enum bpf_map_type type, struct redir_spec *redir,
>  			struct maps *maps, struct socket_spec *s_in,
>  			struct socket_spec *s_out)
>  {
> -	int fd_in, fd_out, fd_send, fd_peer, fd_recv, flags, status;
> +	int fd_in, fd_out, fd_send, fd_peer, fd_recv, status;
>  	const char *in_str, *out_str;
>  	char s[MAX_TEST_NAME];
>  
> @@ -337,26 +319,24 @@ static void test_socket(enum bpf_map_type type, struct redir_spec *redir,
>  	fd_send = s_in->in[redir->idx_send];
>  	fd_peer = s_in->in[redir->idx_send ^ 1];
>  	fd_recv = s_out->out[redir->idx_recv];
> -	flags = s_in->send_flags;
>  
>  	in_str = socket_kind_to_str(fd_in);
>  	out_str = socket_kind_to_str(fd_out);
>  	status = get_support_status(redir->prog_type, in_str, out_str);
>  
>  	snprintf(s, sizeof(s),
> -		 "%-4s %-17s %-5s %s %-5s%6s",
> -		 /* hash sk_skb-to-ingress u_str → v_str (OOB) */
> +		 "%-4s %-17s %-5s %s %-5s",
> +		 /* hash sk_skb-to-ingress u_str → v_str */
>  		 type == BPF_MAP_TYPE_SOCKMAP ? "map" : "hash",
>  		 redir->name,
>  		 in_str,
>  		 status & SUPPORTED ? "→" : " ",
> -		 out_str,
> -		 (flags & MSG_OOB) ? "(OOB)" : "");
> +		 out_str);
>  
>  	if (!test__start_subtest(s))
>  		return;
>  
> -	test_send_redir_recv(fd_send, flags, fd_peer, fd_in, fd_out, fd_recv,
> +	test_send_redir_recv(fd_send, fd_peer, fd_in, fd_out, fd_recv,
>  			     maps, status);
>  }
>  
> @@ -365,12 +345,10 @@ static void test_redir(enum bpf_map_type type, struct redir_spec *redir,
>  {
>  	struct socket_spec *s, sockets[] = {
>  		{ AF_INET, SOCK_STREAM },
> -		// { AF_INET, SOCK_STREAM, MSG_OOB }, /* Known to be broken */
>  		{ AF_INET6, SOCK_STREAM },
>  		{ AF_INET, SOCK_DGRAM },
>  		{ AF_INET6, SOCK_DGRAM },
>  		{ AF_UNIX, SOCK_STREAM },
> -		{ AF_UNIX, SOCK_STREAM, MSG_OOB },
>  		{ AF_UNIX, SOCK_DGRAM },
>  		// { AF_UNIX, SOCK_SEQPACKET},	/* Unsupported BPF_MAP_UPDATE_ELEM */
>  		{ AF_VSOCK, SOCK_STREAM },
> @@ -392,10 +370,9 @@ static void test_redir(enum bpf_map_type type, struct redir_spec *redir,
>  			struct socket_spec *out = &sockets[j];
>  			struct socket_spec *in = &sockets[i];
>  
> -			/* Skip intra-proto and between variants */
> -			if (out->send_flags ||
> -			    (in->family == out->family &&
> -			     in->sotype == out->sotype))
> +			/* Skip intra-proto */
> +			if (in->family == out->family &&
> +			    in->sotype == out->sotype)
>  				continue;
>  
>  			test_socket(type, redir, maps, in, out);
