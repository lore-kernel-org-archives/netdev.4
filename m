Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398010;
	b=14fn4ZA94PcQZlABmp3Y09p531dOjMt/NBK/lXO649hktfOWGBkarArt+hnaallMAHzS
	 QmPAIVjPveYm3p6LXLnLY8bpGGU+0ZFPZLqghqH+srloMbxP+aJkugxSn7Hk/LlQdzVEV
	 d+sAls03rd7LXjNRX7KnuvbLHSPhjJxsZ7sD+JKwsJAVVNXsvQACJzCOktr8QBTc/xtwM
	 68HuHOAyAAT4E67See4bcczNM2mvXedyNyLeFAfx+Id+Hv5Y/4IUOZMFq+W6k9ZlQyXcP
	 R7Uml5fUvZccB3+FvThTqJSe9NHIzyXeREpXZZxoNcZ91mJMJWR4PpMlFDZTzay91JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398010;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=y89p4Zfp3vjpcB8k1IxkJ///JSjR1z1U+uhQSBuiQGA=;
	b=S7xwHRcvk5oPrUykLJKO4yG+SUeiD4ZcOvLFMQZyq62IUB/MMuXrFmdX28Jg0wj2+u62
	 tViAWrNw8IdBcKK6U9rNPPz7T9xxFBcuRGaDQcTxnDARJ/asp/0S6nsKRy+RqfUID9A7+
	 wkJaSykvgxW8BbzhUkdJfu3iQ0FjnZaF1J6p1leE4KaJm2kx8X7l8EEl+DgjSiVs45NUX
	 tZf1+QGOjhXBaxs2DEzZk5hHFvxMBYBQMlEjyoymvvDLnS/9Cz1oC5zIQBsZT4nIkm2Am
	 3A91j7pKBAblTeorX7dbvjqJrsw4H2l+Igq5YkFV5J8PRwt4seIY84obPkXDorX6K9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFxI34y5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFFE606A681;
	Mon, 23 Nov 2026 01:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFxI34y5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D9C1F000C0;
	Mon, 23 Nov 2026 01:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795398010;
	bh=y89p4Zfp3vjpcB8k1IxkJ///JSjR1z1U+uhQSBuiQGA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FFxI34y5GtZr6CUsawb3gkCSqiCeap6v7VnzXzALiAqSh9wCziAo94IfgkhRTuIge
	 yxkbk+qAXh2gh93bulEqxWXjxLwdG8gUO/4FxucytAvn8K1Qa/Dmf2EZZSUvX9OI2g
	 SK5QL/yBzm93ZRmzX8hy00rTfm93fggrks+PHk9FQclSfGzWawBHbkBC2tj1yUUrmZ
	 z7uoy1yt1CvTMqkrNsUOdQoXu6iJbKEwgjDy4Xso9FJfXOWSOPLl7w0vusMAmF0b/8
	 1hL+o3t+TfVn8wF4mwrpVW2y5lsciPJ8mufZ6XATmeWVEGQxzCrf6ddD4uxVPHgVJW
	 wQZTUaXresW6A==
Subject:
 Re: [PATCH net v2] ipv6: fix ioam6_id_wide sysctl on 32-bit architectures
From: netdev-bot+sashiko@kernel.org
To: jain.sm@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, justin.iurman@gmail.com, horms@kernel.org,
 joel.granados@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 01:40:09 +0000
Message-ID: <179539800944.3135.14978978337031412574@kernel.org>
In-Reply-To: <20261122013848.14287-1-jain.sm@gmail.com>
References: <20261122013848.14287-1-jain.sm@gmail.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] proc_ioam6_id_wide() (net/ipv6/sysctl_net_ipv6.c) changes how
  writes are parsed on 64-bit in several ways the commit body does not…
- [Low] proc_ioam6_id_wide() passes a temporary ctl_table `tmp` with only
  .data and .maxlen set to proc_dostring().

--

ipv6: fix ioam6_id_wide sysctl on 32-bit architectures

net.ipv6.ioam6_id_wide was handled by proc_doulongvec_minmax(). This
commit replaces that with a local handler, proc_ioam6_id_wide(), which
formats and parses the u64 through proc_dostring() and kstrtou64(). This
fixes 32-bit architectures, where unsigned long is 4 bytes and the old
handler treated the u64 as a vector of two 32-bit values.

> diff --git a/net/ipv6/sysctl_net_ipv6.c b/net/ipv6/sysctl_net_ipv6.c
> index 1a0a36dcdabc1..61c28df64d582 100644
> --- a/net/ipv6/sysctl_net_ipv6.c
> +++ b/net/ipv6/sysctl_net_ipv6.c
> @@ -30,6 +30,48 @@ static u32 rt6_multipath_hash_fields_all_mask =
>  static u32 ioam6_id_max = IOAM6_DEFAULT_ID;
>  static u64 ioam6_id_wide_max = IOAM6_DEFAULT_ID_WIDE;
>  
> +/* unsigned long is 32-bit on some arches, so handle the u64 here */
> +static int proc_ioam6_id_wide(const struct ctl_table *table, int write,
> +			      void *buffer, size_t *lenp, loff_t *ppos)
> +{
> +	u64 *valp = table->data;
> +	char buf[24] = "";
> +	const struct ctl_table tmp = {
> +		.data	= buf,
> +		.maxlen	= sizeof(buf),
> +	};

[Severity: Low]

The temporary table passed to proc_dostring() has no procname. Will the
sysctl write warning then print "(null)" instead of ioam6_id_wide?

On every write, proc_dostring() calls:

kernel/sysctl.c:proc_dostring() {
	if (SYSCTL_USER_TO_KERN(dir))
		proc_first_pos_non_zero_ignore(ppos, table);
    ...
}

Take kernel.sysctl_writes_strict=0 and a write shorter than 24 bytes at
a non-zero offset. That write reaches warn_sysctl_write(&tmp):

	pr_warn_once("%s wrote to %s when file position was not 0!\n"
		[ ... ]
		current->comm, table->procname);

This is pr_warn_once(), so a message that doesn't name the file would
use up the only warning for the whole system. The old
proc_doulongvec_minmax() path passed the real table here.

Would adding .procname = table->procname to tmp be enough?

> +	loff_t pos = *ppos;
> +	u64 val;
> +	int ret;
> +
> +	if (!write) {
> +		snprintf(buf, sizeof(buf), "%llu", READ_ONCE(*valp));
> +		return proc_dostring(&tmp, write, buffer, lenp, ppos);
> +	}
> +
> +	/* an empty write changes nothing, as with proc_doulongvec_minmax() */
> +	if (!*lenp)
> +		return 0;
> +
> +	/* proc_dostring() would silently truncate a longer input */
> +	if (*lenp >= sizeof(buf))
> +		return -EINVAL;
> +
> +	ret = proc_dostring(&tmp, write, buffer, lenp, ppos);
> +	if (ret)
> +		return ret;
> +
> +	/* a lone "\n" is invalid, a continued write in strict mode is ignored */
> +	if (!buf[0])
> +		return pos ? 0 : -EINVAL;
> +
> +	if (kstrtou64(strim(buf), 0, &val) || val > ioam6_id_wide_max)
> +		return -EINVAL;

[Severity: Medium]

The commit message says:

  One change on 64-bit: a write of two numbers such as "5 6" is now
  rejected with -EINVAL, instead of being a partial write that sets the
  value to 5.

Does proc_ioam6_id_wide() change 64-bit behaviour in other ways that
should be listed too?

The length guard checks the total write size. But _proc_do_string()
copies at most maxlen - 1 bytes and stops at the first '\n' or NUL:

kernel/sysctl.c:_proc_do_string() {
    ...
		while ((p - buffer) < *lenp && len < maxlen - 1) {
			c = *(p++);
			if (c == 0 || c == '\n')
				break;
			data[len++] = c;
		}
    ...
}

So a 24-byte write of 23 characters plus "\n" fits in buf without being
truncated, yet the guard rejects it. The guard also rejects "5\n"
followed by 22 or more bytes, and a value padded with 24 or more bytes
of whitespace. The old path accepted all of these, fully or as a partial
write.

Is the comment "proc_dostring() would silently truncate a longer input"
accurate for these cases?

In strict mode, a continued write at a non-zero offset now returns
-EINVAL if it is 24 bytes or longer, and is ignored if it is shorter.
The old proc_first_pos_non_zero_ignore() path ignored it at any length.

Because _proc_do_string() stops at the first '\n', "\n5" or " \n 5"
leaves buf empty and returns -EINVAL. The old path skipped the newline
in proc_skip_spaces() and set 5.

In the other direction, "5\n6" now succeeds, sets 5 and reports all
bytes consumed. Meanwhile "5 6" and "5\t6" return -EINVAL.

kstrtou64() also skips a leading '+', so "+5" is now accepted. The old
path rejected it in proc_get_long():

	if (!isdigit(*p))
		return -EINVAL;

Two other changes are only described below the --- line, so they won't
reach git history: 21 to 23 digit input is now accepted, and a lone "\n"
at a non-zero offset in non-strict mode is now ignored.

Could the up-front total length check be dropped? After proc_dostring(),
the handler could check whether a terminator was found within
maxlen - 1 bytes, and decide explicitly whether data after '\n' is
rejected. Any 64-bit changes that remain could then go in the commit
body.

> +
> +	WRITE_ONCE(*valp, val);
> +	return 0;
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122013848.14287-1-jain.sm%40gmail.com
