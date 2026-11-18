Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980403;
	b=40ed+PjwOsfy9yVT9fKbdIwsDDCB7lEdMrZcbdF7IR7rnOCQQ1/Cb9PZ9ILJmaPOHnum
	 vleKpkw37vh4YlBDuX/k1DRHUSXmNh/dOMj8QXTKlY3wfpOUJlV4lCfQBcjLJ7x3hlmwH
	 WaNZBaitZHOYcychE91T0u77TlZIfsQOIBqkZ1iQghms9Ytjdl+qqF9L9AxKnKILGAJEL
	 7uh8Cc8077HQAHsJju++KNUHNMaZFi1bWlxojWSXmmKkBCVg9LZeJC1uFnXypj6tTDYiA
	 6ky29+6W8Rw84NWlmbzwbmNgyro53NPapHflUmyCksBvYqU6gQ62jAs5mbY+vDPDgLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980403;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lq08pXz2oO1mnLEMAJoPp9lNJOytVldSqHeb3gUuNIk=;
	b=oASKs32XneasbO4/cOM3btSteopxVF6hyKV6cIDuh5j2nzXPkyQfNX9VMYLJ9DUvce3m
	 H/uxmMJELEwrS7MEaoB73N23n9hdfGbxwykz0jKhRNT9geRbyjJKOV7+DCQ6J7CtIRmvr
	 VjdWYZQqP4YQfYpJzNz5RQJsGDSrlwbnsuUVseI/ktyeIGebdxEAiRhRxH1WKrmriWscM
	 bHV29A534SjtDOdfE9PfY3RYCwCsT09MHs8Y21SJoU1wCpWlkEGQho2TRj5rk32N7yDPw
	 P9GKk4Gg30HY4KOaEgRQu2DjlS3Q8Mk9fetZyq45lIOOqYpjhYYzQLTrd+mM47NIjUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GCwso30C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC82606A325;
	Wed, 18 Nov 2026 05:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GCwso30C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C3F1F000C4;
	Wed, 18 Nov 2026 05:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794980403;
	bh=lq08pXz2oO1mnLEMAJoPp9lNJOytVldSqHeb3gUuNIk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GCwso30CaIdinJYmEMlvk8ij9ndvkk+OCwQOJpn6kV2K4PmITwg9hDMg/KKzDid2u
	 ANEt5xl5bwpceVMb9WHW7nkgXaqyrgdNlTVeffxK+GyyIBe+UjysR5yGhy/CcHsxKP
	 lQa5oLrKsgHTKMUbuRZ9pZowe/IaKyHJu3WLnp5uE6OPvGEoP+2YH2ypyXqSHaC4cP
	 isOTFrSVyBN3EGlPBveJL/ugB6iT10tSVxYS3ntEKhPrIzi08hUAtAPIwIumf5Ri7h
	 l0Ee8pBBMFUo9hkk9Ojx7UMysmCzOYdese6rmYSfU4NVRM7daGp2nHZOVoqnauJdhq
	 EdypvLcuScBqQ==
Subject: Re: [PATCH net v2 2/2] tcp: accecn: initialize AccECN fields in
 syncookie path
From: netdev-bot+sashiko@kernel.org
To: thaisonphan@google.com
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, ij@kernel.org, olivier.tilmans@nokia.com,
 chia-yu.chang@nokia-bell-labs.com, stani@google.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 05:40:01 +0000
Message-ID: <179498040151.3136.12001610371899379772@kernel.org>
In-Reply-To: <20261116023709.132684-3-thaisonphan@google.com>
References: <20261116023709.132684-3-thaisonphan@google.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] On the BPF custom-syncookie path, the new syn_ect_snt
  assignment in cookie_v4_check() (net/ipv4/syncookies.c:508) and…
- [Medium] tcp: accecn: missing option init on 3rd ACK in syncookie path

--

tcp: accecn: initialize AccECN fields in syncookie path

This commit initializes saw_accecn_opt, accecn_fail_mode and syn_ect_rcv
in cookie_tcp_reqsk_init() so they match tcp_openreq_init(). It also sets
syn_ect_snt from the listener's tos/tclass in cookie_v4_check() and
cookie_v6_check(), so the child socket's AccECN validation knows which ECN
codepoint the cookie SYN-ACK carried.

> diff --git a/net/ipv4/syncookies.c b/net/ipv4/syncookies.c
> index 4e0ff3b820627..1a837ed6efa00 100644
> --- a/net/ipv4/syncookies.c
> +++ b/net/ipv4/syncookies.c

[ ... ]

> @@ -502,6 +505,7 @@ struct sock *cookie_v4_check(struct sock *sk, struct sk_buff *skb)
>  		ireq->rcv_wscale = rcv_wscale;
>  	ireq->ecn_ok &= cookie_ecn_ok(net, &rt->dst);
>  	treq->accecn_ok = ireq->ecn_ok && cookie_accecn_ok(th);
> +	treq->syn_ect_snt = READ_ONCE(inet_sk(sk)->tos) & INET_ECN_MASK;

[Severity: Medium]
Is the AccECN option on the third ACK ever looked at on the syncookie
path? With cookies the listener kept no state, so the client's first
AccECN option arrives on the same ACK that cookie_v4_check() and
cookie_v6_check() turn into a child. On the normal SYN_RECV path,
tcp_check_req() records it before the child is created:

net/ipv4/tcp_minisocks.c:tcp_check_req() {
    ...
	if (tcp_rsk(req)->accecn_ok && tmp_opt.accecn &&
	    tcp_rsk(req)->saw_accecn_opt < TCP_ACCECN_OPT_COUNTER_SEEN) {
		u8 saw_opt = tcp_accecn_option_init(skb, tmp_opt.accecn);

		tcp_rsk(req)->saw_accecn_opt = saw_opt;
    ...
}

Here cookie_tcp_reqsk_init() sets saw_accecn_opt to
TCP_ACCECN_OPT_NOT_SEEN. Nothing between cookie_tcp_check() and
tcp_ecn_openreq_child() calls tcp_accecn_option_init(), even though
cookie_tcp_check() already parses the options into tcp_opt.accecn.
The child therefore starts with tp->saw_accecn_opt ==
TCP_ACCECN_OPT_NOT_SEEN.

The tcp_child_process() -> tcp_rcv_state_process() -> tcp_ack()
pass on the same skb does not fix this. snd_una already equals
ack_seq, and ts_recent was copied from req->ts_recent. So neither
FLAG_FORWARD_PROGRESS nor FLAG_TS_PROGRESS is set, and
__tcp_accecn_process() returns before it reaches
tcp_accecn_process_option().

With saw_accecn_opt stuck at zero:

 - tcp_established_options() never emits AccECN options, even though
   accecn_opt_demand is set.
 - A zeroed option on the third ACK is not caught as
   TCP_ACCECN_OPT_FAIL_SEEN.
 - TCP_INFO reports tcpi_accecn_opt_seen as 0.
 - Later processing in tcp_accecn_process_option() can flag
   TCP_ACCECN_OPT_FAIL_RECV on a connection where the peer did send
   the option.

This patch is aligning the cookie path with tcp_openreq_init(), so
should cookie_v4_check() and cookie_v6_check() also do the equivalent
of the tcp_check_req() block once accecn_ok is known? The parsed
tcp_opt is local to cookie_tcp_check() and is not available on the
cookie_bpf_check() path. Would you prefer to re-parse the options
there or plumb them through? Or is this meant as a separate fix?

[Severity: Medium]
Does this assignment also apply to requests that come from
cookie_bpf_check()? On that path the kernel never sent the SYN-ACK. A
TC/XDP program built it, and bpf_sk_assign_tcp_reqsk() only gets an
ecn_ok bit from struct bpf_tcp_req_attrs:

net/core/filter.c:bpf_sk_assign_tcp_reqsk() {
    ...
	ireq->ecn_ok = !!attrs->ecn_ok;
    ...
}

So the program has no way to report which ECN codepoint it put on the
SYN-ACK, and the listener's tos/tclass is only a guess here.

The in-tree reference program sends Not-ECT for both families, in
tools/testing/selftests/bpf/progs/test_tcp_custom_syncookie.c:tcp_handle_syn():

	ctx->ipv4->tos = 0;
    ...
	*(__be32 *)ctx->ipv6 = bpf_htonl(0x60000000);

When the listener runs DCTCP or another TCP_CONG_NEEDS_ECN CC, its
tos/tclass carries ECT(0), so syn_ect_snt becomes ECT(0) here.

An AccECN client that receives the Not-ECT SYN-ACK reflects it in the
third ACK through tcp_accecn_reflector_flags(), giving ACE=0b010.
cookie_accecn_ok() then sets accecn_ok, and the child setup does:

tcp_get_cookie_sock()
  ->syn_recv_sock()
    tcp_ecn_openreq_child()
      tcp_accecn_third_ack(sk, skb, treq->syn_ect_snt)
        tcp_accecn_validate_syn_feedback()
            if (!tcp_ect_transition_valid(sent_ect, ect)) {
                tcp_accecn_fail_mode_set(tp, TCP_ACCECN_ACE_FAIL_RECV);

Would this set a false TCP_ACCECN_ACE_FAIL_RECV, the same failure the
commit message describes, on every BPF syncookie connection to an
ECT-marking listener? Before this patch the field was uninitialized. On
zeroed memory it read as 0, which happened to match the Not-ECT SYN-ACK
from that program.

The same applies to the IPv6 line below, which uses np->tclass.

Could the listener's tos/tclass be skipped for BPF-validated requests
(req->syncookie set by the kfunc)? Alternatively, struct
bpf_tcp_req_attrs could carry the SYN-ACK ECN codepoint.

>  
>  	ret = tcp_get_cookie_sock(sk, skb, req, &rt->dst);
>  	/* ip_queue_xmit() depends on our flow being setup
> diff --git a/net/ipv6/syncookies.c b/net/ipv6/syncookies.c
> index b33011b71fff6..7435ebcc366cd 100644
> --- a/net/ipv6/syncookies.c
> +++ b/net/ipv6/syncookies.c
> @@ -276,6 +276,7 @@ struct sock *cookie_v6_check(struct sock *sk, struct sk_buff *skb)
>  		ireq->rcv_wscale = rcv_wscale;
>  	ireq->ecn_ok &= cookie_ecn_ok(net, dst);
>  	tcp_rsk(req)->accecn_ok = ireq->ecn_ok && cookie_accecn_ok(th);
> +	tcp_rsk(req)->syn_ect_snt = READ_ONCE(np->tclass) & INET_ECN_MASK;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116023709.132684-1-thaisonphan%40google.com
