Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821842;
	b=dOBvpHFQmUFrTJLNMHPdBHv9tR05fuK0XwTgzjpWQ0MwFlp/+k2cVfO2rTKxIn6fIOBN
	 ABaSBkWFVf5jxDiR1huSpfLR9DJeOuB6KlWTA/642dWSO6s/Wae4S0exyEtXnWlHnvMQI
	 8apbuTuIhHuz9OUV7ZZo6yLpSblzp84a7Pb/19Kg2n3FD18PLOJNO6HKO2TOkb4v/ojyy
	 H+ggRsoh6T0MfZi6Y4mT/Mheoy9YVp2JfxY3LgHMjMMMtkrL391Ng8pDNrbqZPywMtyIr
	 ZRb6AkSz882LPbNplsBc11WsLUAxvOKKvIrKF06FuX3h89ep6YH+JEP614rQjuXbL9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821842;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=tr+ptdFAOHmNGIVwaASfOid//+Rw4qYWo/QDPFKYOHw=;
	b=TheLE8TTpBHIXRCqh7GKJrNg4PUOjTFokx1zgZTjLwmyB5tb+Sn51ShbAdEG1xlZHeN1
	 UEJEc5MxXeR4vxiamRzwkrBRRldZrDT8d8Oua51+pF88g7bJ9DsgvtlCakQJVweMFeME7
	 000X3fP4OU7M2EI2/b4YvbPRElpK2EaNd2OLQtPof9dxdwVzA1oMY5V6nd3HnVtyqGp0c
	 aGiFundEJZkYQssfahjMWVQuFM6GDdFfv2Rv0StRcyFwBBi3zw9NyIXuGVyVuCnZOKokL
	 YHoOm+8ornKEXHhWN8W6JdjGy85X0pSJ+8NNvvmq5Y4Dj66Ov8DuaE7ZWswBAT1zgRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NrwafniQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3BD606A31E;
	Fri, 27 Nov 2026 23:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NrwafniQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E702C1F00899;
	Fri, 27 Nov 2026 23:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795821841;
	bh=tr+ptdFAOHmNGIVwaASfOid//+Rw4qYWo/QDPFKYOHw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NrwafniQmUNQ91WV8B0N3prb+CnnuIl4xRxkTgXMZcXQ4dUYEPGwtZF/Iv/U/2IAb
	 ug/SqFVMdiC+70zOMsuyoa/Xx++Wug1O/2pR2WPeLlrgVimGJyfXBjEUq0FB8kzim6
	 HmU33JcVCZezX5VQxcXhijbrgdD4ZbyGjyyc1gvHbhqYOng9j2n3SEsl7IPXtLLP6W
	 KsGzdK5P8zPTKnpi4bt5TORRavWRv/Ic7g8JQb41O+lMU3tfm1znZlNVUoWZO84mD/
	 0p7/KzUqz+1fa5Dt9JqrP5getFOFK26mQvFacasxmXS0Q6hTTWy2PqYB+A5Isd36gl
	 4S3KXVXwAx96g==
Subject: Re: [PATCH net-next] rxrpc: Reject unsecured calls to userspace
 services with a minimum level
From: netdev-bot+sashiko@kernel.org
To: bugs@stellman-greene.com
Cc: dhowells@redhat.com, marc.dionne@auristor.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-afs@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 27 Nov 2026 23:24:00 +0000
Message-ID: <179582184048.3135.8278153392391816452@kernel.org>
In-Reply-To: <20261126224137.55862-1-bugs@stellman-greene.com>
References: <20261126224137.55862-1-bugs@stellman-greene.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.
- [Medium] After this patch, RXRPC_MIN_SECURITY_LEVEL means different
  things depending on rx->sk.sk_kern_sock, and the documentation does…
- [Low] The new reject path in rxrpc_get_incoming_security() returns NULL
  without calling rxrpc_direct_conn_abort() with its own reason.
- [Low] The commit is described as a fix for a security-policy bug (a
  service minimum security level that is not enforced for unsecured…

--

rxrpc: Reject unsecured calls to userspace services with a minimum level

This patch makes rxrpc_get_incoming_security() refuse incoming calls with
security index RXRPC_SECURITY_NONE when a userspace service socket has set
RXRPC_MIN_SECURITY_LEVEL above RXRPC_SECURITY_PLAIN. Kernel sockets are
exempted, because kAFS and rxperf set RXRPC_SECURITY_ENCRYPT on the sockets
they serve on.

> Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>

[Severity: Low]
This isn't a bug, but should this have a Fixes: tag? The changelog
describes the patch as a fix for a security policy bug.

The patch also deliberately changes behaviour for existing userspace
services. Could the changelog say whether it is meant for stable?

> diff --git a/net/rxrpc/security.c b/net/rxrpc/security.c
> index 2bfbf2b2bb37a..52015c73c583c 100644
> --- a/net/rxrpc/security.c
> +++ b/net/rxrpc/security.c
> @@ -138,6 +138,11 @@ const struct rxrpc_security *rxrpc_get_incoming_security(struct rxrpc_sock *rx,
>  
>  	_enter("");
>  
> +	if (sp->hdr.securityIndex == RXRPC_SECURITY_NONE &&
> +	    rx->min_sec_level > RXRPC_SECURITY_PLAIN &&

[Severity: High]
The commit message gives the root cause as:

  rxrpc_get_incoming_security() doesn't check rx->min_sec_level

This check only covers security index NONE, though. Will a userspace
service socket with RXRPC_MIN_SECURITY_LEVEL set to RXRPC_SECURITY_ENCRYPT
still accept rxkad or rxgk calls negotiated at a lower level?

In rxkad_verify_response(), the level comes from the client's RESPONSE
packet. It only gets an upper bound check:

net/rxrpc/rxkad.c:rxkad_verify_response() {
    ...
	level = ntohl(response->encrypted.level);
	if (level > RXRPC_SECURITY_ENCRYPT) {
		...
	}
	conn->security_level = level;
    ...
}

rxgk_verify_response() does the same thing with the token level:

net/rxrpc/rxgk.c:rxgk_verify_response() {
    ...
	conn->security_level = token->rxgk->level;
    ...
}

Neither of these compares the level against rx->min_sec_level. Apart
from the setters and this new check, min_sec_level is only read in the
client call setup paths, rxrpc_kernel_begin_call() and
rxrpc_new_client_call_for_sendmsg().

An authenticated client could answer the CHALLENGE with level
RXRPC_SECURITY_PLAIN or RXRPC_SECURITY_AUTH. Its calls would then reach a
service that requires ENCRYPT. At PLAIN level the data has no integrity
protection either.

That seems to contradict Documentation/networking/rxrpc.rst, which
describes the option as "the minimum security level required for calls
on this socket".

The gap is only mentioned below the --- line, so the note won't end up
in git history. Should the negotiated level also be checked where the
connection gets secured, in rxkad_verify_response() and the rxgk verify
path?

> +	    !rx->sk.sk_kern_sock)

[Severity: Medium]
With this exemption, RXRPC_MIN_SECURITY_LEVEL means different things
depending on sk_kern_sock. Is that split meant to be documented?

For userspace service sockets, the option now also rejects incoming
NONE calls.

For kernel sockets that use rxrpc_sock_set_min_security_level(), it is
still only the level used for outgoing client calls:

net/rxrpc/sendmsg.c:rxrpc_new_client_call_for_sendmsg() {
    ...
	cp.security_level	= rx->min_sec_level;
    ...
}

The in-tree kernel users already depend on this client-only meaning.
afs_open_socket() sets ENCRYPT on the CM service socket, and that socket
must accept unsecured fileserver callbacks:

fs/afs/rxrpc.c:afs_open_socket() {
    ...
	ret = rxrpc_sock_set_min_security_level(socket->sk,
						RXRPC_SECURITY_ENCRYPT);
    ...
}

rxperf does the same.

Documentation/networking/rxrpc.rst uses the same words for the sockopt
and for rxrpc_sock_set_min_security_level(): "the minimum security level
required for calls on this socket". It doesn't cover the new service
side enforcement or the kernel socket exemption.

A userspace program built like kAFS uses one socket to make encrypted
client calls and to accept unsecured callbacks. With this patch, its
incoming calls will be aborted.

It could bind a separate client socket to the same transport address as
a workaround. Existing programs would still break with no indication of
why.

Should Documentation/networking/rxrpc.rst be updated to describe this
behaviour?

> +		return NULL;

[Severity: Low]
The other two NULL returns in rxrpc_get_incoming_security() call
rxrpc_direct_conn_abort() with their own reason, but this one doesn't.
Will this rejection be traced as rxrpc_abort_service_not_offered?

The caller falls through to this code:

net/rxrpc/call_accept.c:rxrpc_new_incoming_call() {
    ...
unsupported_security:
	read_unlock_irq(&local->services_lock);
	return rxrpc_direct_conn_abort(skb, rxrpc_abort_service_not_offered,
				       RX_INVALID_OPERATION, -EKEYREJECTED);
    ...
}

So trace_rxrpc_abort reports "service not offered" even though the
service is bound and listening. The peer gets a generic
RX_INVALID_OPERATION abort.

This fallback in rxrpc_new_incoming_call() also overwrites the abort
codes set by the existing NULL paths in rxrpc_get_incoming_security().
That part is older than this patch.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126224137.55862-1-bugs%40stellman-greene.com
