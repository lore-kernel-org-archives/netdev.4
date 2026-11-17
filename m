Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944232;
	b=20Xg0BvYVKDjQR8Jk2j13/b4TqpHKMXoInmweML2jVaas6S9pctCyxQJGv9sYqn8D0G6
	 HVmSkSs+T9ScMiSNXVDeT0hx4RIHbZ506SDoFrzN487o+Zi5ZXLHJuQL3WUjInNYE2h17
	 3jf/8Y+by9rKetrxkzHtKlWzykTEKOejaARggkh6w9pcEs15wZ4MVni9keNXSjYALTo7K
	 Ov3L+94iKh0FMkAIfpVW34x83o51NrT4OWaHOlFAWtQrn5QFesiNK9beZJVHyAuarNEKa
	 EGzfn1BfibryUGkFWArOFFfwxl6v7FncFt3H6LBBEMuI6uAr1zCKP7uKTZTc/ZqeY2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944232;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=gW8KOdqoLUAXafTFi4cisifg0ee0u5sy8ei2MLsFIzc=;
	b=nb+tWUtYUjSdZdKEhQM3S8QgDLmu/ItNCI3MKIZs8RgeyZMMN3k5oZYrsTjARm3Yvpbu
	 RTvJBJzouC76VNiR5PKRmztejZVdeg23zovw8sFrY4yEbH+lwB6zsBz4BLz/TyKnTrOt8
	 IiK8OF91hp0gHtxTh94kdDUkUvBno0GcHbnINtF+DbTfS0rOMEXH9H5Nj9PRVBYHOwTHo
	 4OAQ22mOvmAeI7xgamQVhe4oJ+18ChuXkDhKBW413ZYsGeZGy7d7QWgxy349odVkQtPzX
	 Pn/boTCk6xun6KXeOH9xkclGxEhLiqKSATq/Ar1t8MIXOUVvnAs+rvR3rXpnDTWNMmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MfB1WL1x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5370E606A31C;
	Tue, 17 Nov 2026 19:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MfB1WL1x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D84C1F000C4;
	Tue, 17 Nov 2026 19:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794944232;
	bh=gW8KOdqoLUAXafTFi4cisifg0ee0u5sy8ei2MLsFIzc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MfB1WL1x56Og0KxVuXiqnMMezgCVVSuE6TgkHCv/BAb90fkXaZtMNyKsigowfexIh
	 MgKYeyCNWzcXOFoWGC0SJd69lnK2SO17jdqJcECsDQEuQG02p6VjHZGh/fufpzCSCQ
	 QWH7kbIZIlFbeyDTvDBp7xA3b9oqWa0gpYi/CWAYed86xi7NRyrXGhdvbTG1l9R4aB
	 a2MneUxIDOQttjFd6eeBOtYJjSSanQV4JMpNPFOCDQ0zGXKNrmBI0Fvk5w8eUWP3OB
	 QeRn6xQltvZtNR/LaRW+Mn/u5GsPMvWMCKvBQEgrYiT7H8DZV0G4ZmYwnIE7RAP/Nr
	 iRiBApDOPBf2A==
Subject:
 Re: [PATCH net] tls: fix send() returning success after the TCP send failed
From: netdev-bot+sashiko@kernel.org
To: hengyul@cs.unc.edu
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org,
 bcodding@hammerspace.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2026 19:37:11 +0000
Message-ID: <179494423118.3136.8585648119443457824@kernel.org>
In-Reply-To: <20261113193649.3822306-1-hengyul@cs.unc.edu>
References: <20261113193649.3822306-1-hengyul@cs.unc.edu>
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

Critical: 0 · High: 1 · Medium: 3 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix only works for the first send().
- [Medium] The broadened condition in bpf_exec_tx_verdict()
  (net/tls/tls_sw.c:714-717) now runs the 'record was not sent' cleanup…
- [Medium] bpf_exec_tx_verdict() reads sk->sk_err twice with plain loads
  (net/tls/tls_sw.c:714 and :717), and the free operations run between…
- [Medium] To decide whether the record failed, the fix checks the shared
  sk->sk_err field instead of the error that tls_push_record() returned.

--

tls: fix send() returning success after the TCP send failed

This patch changes bpf_exec_tx_verdict() so that any non-zero sk_err
after a failed tls_push_record() means the record was not sent. Before,
only EBADMSG meant that. The goal is to make send() on a kTLS socket
return an error again once the TCP side can no longer send. That stopped
working after commit b341ca51d267 ("tls: Fix tls_sw_sendmsg error
handling").

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 226e0f176fdc8..f3e496fa47ae6 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c
> @@ -711,7 +711,7 @@ static int bpf_exec_tx_verdict(struct sk_msg *msg, struct sock *sk,
>  	int err;
>  
>  	err = tls_push_record(sk, flags, record_type);
> -	if (err && err != -EINPROGRESS && sk->sk_err == EBADMSG) {
> +	if (err && err != -EINPROGRESS && sk->sk_err) {

[Severity: High]
Does this fix still hold after the first send()? The EPIPE that
tls_err_abort() records seems to get consumed on the way out of
tls_sw_sendmsg_locked():

tls_sw_sendmsg_locked()
  bpf_exec_tx_verdict()
    tls_push_record()
      tls_tx_records()
        tls_err_abort(sk, -EPIPE)    /* sk->sk_err = EPIPE */
    returns -EPIPE
  ...
end:
  ret = sk_stream_error(sk, msg->msg_flags, ret);

net/core/stream.c:sk_stream_error() {
	if (err == -EPIPE)
		err = sock_error(sk) ? : -EPIPE;
	...
}

sock_error() does xchg(&sk->sk_err, 0). After that, the only thing that
refuses new data is the check at the top of the send loop. tls_sw has no
SEND_SHUTDOWN check:

	while (msg_data_left(msg)) {
		if (sk->sk_err) {
			ret = -sk->sk_err;
			goto send_end;
		}

So once sk_err has been cleared, two things seem possible.

First, a later send() with MSG_MORE, or one that doesn't fill a record,
copies data into a new open_rec. It never pushes the record and returns
the byte count as success. Before b341ca51d267 the EBADMSG survived
sk_stream_error(), so this send failed at the loop check.

Second, a later send() without MSG_MORE allocates a new tls_rec in
tls_get_rec() with kzalloc(mem_size, sk->sk_allocation).
tls_do_encryption() encrypts it and adds it to tx_list. tls_tx_records()
then fails again on the stuck partially_sent_record at the head of
tx_list. bpf_exec_tx_verdict() frees only msg_plaintext, so the record and
its ciphertext stay queued until tls_sw_release_resources_tx() at close.

sk_stream_memory_free() never stops this, because sk_wmem_queued and
write_seq don't change. The tls_rec is about 2 KB and is charged to
neither tcp_mem nor memcg. Only about 30 bytes of ciphertext per record
go through sk_wmem_schedule().

Could an unprivileged process that loops on send(MSG_NOSIGNAL) on its own
shut-down kTLS socket grow unaccounted kernel memory without bound?

The note below the --- line mentions that records keep getting queued.
Since sk_err is consumed on every EPIPE return, would the abort state need
to be latched some other way? For example, a TLS-private abort flag, or a
check of SEND_SHUTDOWN or the partially sent/abort state at the top of the
loop.

[Severity: Medium]
Is the shared sk->sk_err a reliable way to tell whether this particular
record failed?

tls_tx_records() calls tls_err_abort() and then returns the same rc.
tls_err_abort() calls sk_error_report(), which wakes poll/epoll waiters
with EPOLLERR:

tls_tx_records() {
    ...
tx_err:
	if (rc < 0 && rc != -EAGAIN && rc != -EINTR && rc != -ERESTARTSYS)
		tls_err_abort(sk, rc);

	return rc;
}

A woken thread will often call getsockopt(SO_ERROR), and
sk_getsockopt()->sock_error() clears sk_err without taking lock_sock. If
that happens before the check here, the condition is false and the record
stays counted in *copied.

tls_sw_sendmsg_locked() then goes to send_end with ret = -EPIPE. Since
copied > 0, send() returns the full byte count for data that never reaches
the peer.

That looks like the same symptom the commit message describes. The error
is already in err, so could the decision use the returned error instead?

The signal also isn't tied to the current call. With async crypto,
tls_encrypt_done() can set sk_err for an earlier record without taking
lock_sock:

	if (err || sk->sk_err) {
		...
			tls_err_abort(sk, err);

With the broader test, wouldn't a -EAGAIN, -EINTR or -ERESTARTSYS for the
current record then be treated as not sent?

>  		*copied -= sk_msg_free(sk, msg);
>  		tls_free_open_rec(sk);

[Severity: Medium]
Is this cleanup correct when the failure comes from tls_tx_records()
rather than from encryption?

At that point tls_do_encryption() has already added the record to tx_list
and set ctx->open_rec = NULL. tls_push_sg() has also saved it:

	ctx->partially_sent_offset = offset;
	ctx->partially_sent_record = (void *)sg;

So tls_free_open_rec() does nothing and sk_msg_free() frees only
msg_plaintext. *copied drops by the whole plaintext size, but the
ciphertext stays queued.

That record can still be sent later. sk_err can be cleared by SO_ERROR or
by sock_error() in the recv path, and once TCP can send again the record
goes out through one of:

  tls_sw_sendmsg_locked()->tls_tx_records() on the next send
  tx_work_handler()
  tls_sw_release_resources_tx()->tls_tx_records(sk, -1) at close

Some non-terminal errors reach this path:

  IP_RECVERR, which an unprivileged user can set. If an ICMP error
  arrives while tcp_sendmsg_locked() sleeps in sk_stream_wait_memory(),
  it sets sk_err, and tcp_sendmsg_locked() returns something like
  -EHOSTUNREACH on a connection that is still alive.

  TCP_REPAIR with TCP_NO_QUEUE, which returns -EINVAL. This one needs
  CAP_NET_ADMIN.

tls_push_sg() may also have put part of the record on the wire before it
failed. If userspace is told the bytes weren't sent and sends them again,
can the peer receive the data twice?

This cleanup fits the encryption-failure path. There, tls_do_encryption()
list_del()s the record and it is still ctx->open_rec. Before this patch,
these other errors left the record counted, which matched its later
delivery. The pre-b341ca51d267 EBADMSG behaviour that this patch brings
back had the same mismatch.

>  		err = -sk->sk_err;

[Severity: Medium]
Can sk->sk_err change between the check above and this read?

Both are plain loads, with the frees in between.
getsockopt(SO_ERROR) reaches sk_getsockopt()->sock_error() without taking
lock_sock, so it can run while sendmsg holds the socket lock:

CPU1 (sendmsg, lock_sock held)       CPU2
bpf_exec_tx_verdict()
  sees sk->sk_err != 0
  *copied -= sk_msg_free(sk, msg);
  tls_free_open_rec(sk);
                                     getsockopt(SO_ERROR)
                                       sock_error()
                                         xchg(&sk->sk_err, 0)
  err = -sk->sk_err;   /* 0 */

tls_sw_sendmsg_locked() treats a 0 return as success and skips all error
handling. If this was the last chunk, send() returns
copied > 0 ? copied : ret instead of -EPIPE. That value can be 0, or a
count that silently leaves out the dropped record.

The same double read existed with the old EBADMSG test. This patch,
though, rewrites these lines and applies them to every TCP send failure.

Would it help to take a single READ_ONCE() snapshot, as the recvmsg path
in this file does, or to use the returned err? The plain reads also race
with the WRITE_ONCE() in tls_err_abort() and the xchg() in sock_error(),
which KCSAN would report.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113193649.3822306-1-hengyul%40cs.unc.edu
