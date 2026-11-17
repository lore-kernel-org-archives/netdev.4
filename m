Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935972;
	b=H7m9fRKylDaoB/a2Lc+h6ZsbB9dCakt2CUpv4C1tMxct21nzXV6ld5rslIVTk/TJC5cY
	 5db/vDeJrYC64RxDDLXijxrkTtN4Abryp91GUv1DFm8Zd07X8wuYaTMsw2nHpti4u7E/L
	 Ef4ZW1wk7E7JX+39cQGYnLuRKI9GnKkasxmuJl5XSuGtffHzHTc6bmlyS00k0tluepDkN
	 c/6d8ziRMhWlx0FAZuiOu1/uP+y9nPDgLf6I8/U7o0khVn1LI02gUPv4Shc1u69USID8o
	 5dMbAU870MMcwHIpaysFwj9YcqNXv9crL7qTuKJZg6jF7K+6o1Vvd0ZD9gMc70QEh0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935972;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=huFHxyOwSJEeq70j8XuTfasaKzIzpOtIVN2ePHRwlVI=;
	b=alNK6+4HZvuqxy74HH4ERGWyGqyHL77KimxeLl8L+4ymNnpJfnFU+iXwcLo/ur+ExqwF
	 McwFHSBKIRaOoUc3ZCyG8O534cxOTiVMHk/VjrPW72hh4i8eft6bBzxDvdvbooienTweW
	 DR3ChxUwgixlH2jdWN7eH8uSWlXatM/9/NGJpExMj3h0fVYSB4RRJG+1/xUSTykjt8y7j
	 nvYmd2GUUGle3yvKJ6FRFb6PvqvraSzyNKz0lusI934bLLa6kQFSsmfLxKdieqxG8lcZS
	 /hGt3F6cVziPNsGp6k5cHRH6+nwFnlemc6awhXML6GppGB/xGXeOU6F0QoSU4BbhSQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nCHLintG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D503606A334
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nCHLintG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100641F000CB;
	Tue, 17 Nov 2026 17:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794935972;
	bh=huFHxyOwSJEeq70j8XuTfasaKzIzpOtIVN2ePHRwlVI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nCHLintGCNiF4KRb2IaSPS+XqLo4EM4FX0BNGKoUa5tVOTV8jERZosLpXOA9owL4b
	 6SSCnodMnUT+iEQ92mE5Z3POZVU+l+6sjYlT82pumJd9lDJKBmDb09dpxpz7jCbYpK
	 eLmNu/q89PHFsMA0mkoIlimAu0N0IB7JgmWQbs4W0gPItU7Zzqspf5FDMf1VK1s+0p
	 paNrxH9s4Dv1kpdMuCmR6LJpxl1DarqTsCEzgCjwN5m6ctPfpksfcnXonahVo0l47Y
	 1GX6H1o4dYe5xHt34Hkw5xSS39lD1nTu/z8kE4ZbSGyNlAyED80qY0i3JA1+ZkkhdY
	 9P4aLcoszIV8w==
Subject: Re: [PATCH v1 net-next 2/4] selftests: bpf: sockmap: Remove AF_UNIX
 MSG_OOB test case.
From: netdev-bot+sashiko@kernel.org
To: kuniyu@google.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, kuni1840@gmail.com,
 netdev@vger.kernel.org
Date: Tue, 17 Nov 2026 17:19:31 +0000
Message-ID: <179493597161.3136.12291669288172895358@kernel.org>
In-Reply-To: <20261116021845.2533130-3-kuniyu@google.com>
References: <20261116021845.2533130-3-kuniyu@google.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In test_redir() and test_send_redir_recv()
  (tools/testing/selftests/bpf/prog_tests/sockmap_redir.c), the patch…
- [Low] At this commit, the only selftest covering AF_UNIX MSG_OOB with
  sockmap is gone: the `{ AF_UNIX, SOCK_STREAM, MSG_OOB }` entry in…

--

selftests: bpf: sockmap: Remove AF_UNIX MSG_OOB test case.

This commit removes the AF_UNIX SOCK_STREAM MSG_OOB case from the
sockmap_redir selftest, because MSG_OOB support is going to be dropped
from AF_UNIX. It also removes the socket_spec.send_flags field, which is
no longer used, and the OOB handling in test_send_redir_recv() and
test_socket().

> diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_redir.c b/tools/testing/selftests/bpf/prog_tests/sockmap_redir.c
> index 9c461d93113db..e73d3a674a741 100644
> --- a/tools/testing/selftests/bpf/prog_tests/sockmap_redir.c
> +++ b/tools/testing/selftests/bpf/prog_tests/sockmap_redir.c

[ ... ]

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

[Severity: Low]
With these assertions and the { AF_UNIX, SOCK_STREAM, MSG_OOB } entry
in test_redir() removed, does any selftest still cover AF_UNIX MSG_OOB
together with sockmap at this commit?

The kernel side is still present here. AF_UNIX send(MSG_OOB) still
works, and unix_stream_bpf_recvmsg() still has the rejection:

net/unix/unix_bpf.c:unix_stream_bpf_recvmsg() {
    ...
	if (flags & MSG_OOB)
		return -EOPNOTSUPP;
    ...
}

This seems to be intentional and only lasts until the end of the series.
After the later patch "af_unix: Remove MSG_OOB.", unix_stream_sendmsg()
and unix_dgram_sendmsg() return -EOPNOTSUPP for MSG_OOB, and the receive
paths reject it as well. At that point, the "OOB dropped on redirect"
behaviour checked here no longer exists, and the removed case would fail
at send().

Removing the test before the feature looks like the right order. This
note is only about the short coverage gap between the two patches.

[ ... ]

> @@ -365,12 +345,10 @@ static void test_redir(enum bpf_map_type type, struct redir_spec *redir,
>  {
>  	struct socket_spec *s, sockets[] = {
>  		{ AF_INET, SOCK_STREAM },
> -		// { AF_INET, SOCK_STREAM, MSG_OOB }, /* Known to be broken */

[Severity: Low]
This isn't a bug, but the commit message only mentions the AF_UNIX case
and send_flags:

  Let's remove the test case from sockmap_redir.

  Note that struct socket_spec.send_flags is no longer used so
  removed too.

This line also drops the commented-out TCP MSG_OOB entry and its "Known
to be broken" note. The entry never ran, and without send_flags it could
not stay as written: MSG_OOB would land in in[0].

Would it be worth mentioning in the commit message that the in-tree note
about TCP plus sockmap OOB being broken is removed as well?

>  		{ AF_INET6, SOCK_STREAM },
>  		{ AF_INET, SOCK_DGRAM },
>  		{ AF_INET6, SOCK_DGRAM },
>  		{ AF_UNIX, SOCK_STREAM },
> -		{ AF_UNIX, SOCK_STREAM, MSG_OOB },
>  		{ AF_UNIX, SOCK_DGRAM },

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116021845.2533130-1-kuniyu%40google.com
