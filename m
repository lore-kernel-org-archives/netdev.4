Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795081823;
	b=enpg2KWWG4cUA+IurRwdDMOC3e1YPFKxTMd2MiNlmshfrRedS3EGHFuBc3uS9PbzrTo5
	 fXDwvPspfSQHeXCeRneVwjDak1SRZ3DigH31k/sedqKOPeupKBRU/UdvI/wBJbGKdEdT7
	 2+H3fKhK/1y3mWu18sSC1ePvSm68f54eLpZnIUOK/83dDR9q8o4fQPG7a8QMBKkh8iXNH
	 yFyHWiGYxSb9eFsEbYOyKDAcloMyRB991fJ8Jx6xYjjvOx79sEu9KEggrZv93IMf9Lxm3
	 9zOkiIdC/aDJCkfhdyNWzVjIaF36OxMCthh3FMhzyH+/+WClgc9vgf0TEKNMGkwYjLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=dZ4cmAmQesCm/MvGfei3ceTdFCLl5G2LA1H0kN3O7dY=;
	b=Ay1JHWlWOz9yP/c0JD5rE4CY111ftDg8nUzi+CeMOpkjpCt6Sow/KE1YPaix3zMVAX7K
	 okhoTuWiCtCKFPoLGFzCPMeiAf9QuAVTR0JnMfH3fMRJsrosGxy1WOp8ap0JQmBaXr0hf
	 0saZn2G58qTw4ChHKvFDDd4JcIkHMfNDm24y7mEpNsNTHObHzsQZX63z6IxuZMqu+9iD5
	 wFnMZCT5dhr0HRO14EKBs4DWXa9ibu7DaxLc6E8ggrDtt5oigRNKk+br84V2cNUb79gXV
	 c1aC/TWo+/qUU33R9XXSF1FIkyLjqpUCLlcQ30AOz6PW1mgEQeLQe8WMaAQSwVrHKjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=x+xF1Jqq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B59606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28B59606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=x+xF1Jqq
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso485569b3a.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:50:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795081821; cv=none;
        d=google.com; s=arc-20260327;
        b=f4XHGDYuCWWg/xXelZMnAzVLNjtu1iDu54mAlac6IsRRFSf5Demz7vaay3hVKsR161
         IHmW2+4DK82cO6MDRLCORr9bJgJAYQ1Zn0ruXBquZrfLHIJ//Tbdd8GvdV6O820o197V
         XMkXutqdkQMlNBruOwn7EKRDvUcvQfzLJvfiq4mZ5GLcpybMCIMmgoSkK4z1dVDLG7NV
         bdLd8FIuaVF1hVC8X+97ajBzdRSLzVmBpowgQ0qmiTgcVRXlFVo8rIiBGc+L2WAU8k7W
         fWdEq7B+tq26NDYvW+GirMoV90TNp9Q3Cm/QdkRz4my5VKzj2arCEFlFiK5HzdYtQSt5
         uvlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dZ4cmAmQesCm/MvGfei3ceTdFCLl5G2LA1H0kN3O7dY=;
        fh=6bY35F0mzzlZP92zSxN9Kmv7YQUSN9HPY06IHGpkuoE=;
        b=bMz/ncXFzTvl/DB3sX89BjA7SiYXzK3IkcPomOOZ3n4zOJWW1qnYfaPVRkTNaDkjfj
         aRclMHuQ32v+9Cly2JNvzWfcFJYESy12DqnI8V04ugleI0F1WBzbS1sax418vGz5u4Qg
         IDnADJNxcLPJ+hOjlz5qrqOE175jxmojVnHChjX9+Cw7tA4HMPK5Tqm4gxi0C3WREaJQ
         kDwtakNASOhMHwRwBbJxIjyp2VhRXVd7X7UlIbk/73EOjR4N/I2SzyEz5Sla8esS8FT4
         gXb03q/jrBcwSqHItbcrrG6mY5J1CR3ZlFmWq1pul27u4L0TKl4HPu8qPRHFPNepA9di
         VjfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795081821; x=1795686621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dZ4cmAmQesCm/MvGfei3ceTdFCLl5G2LA1H0kN3O7dY=;
        b=x+xF1JqqzCLlhLakSZn1kp+q3DvlNn8RmtCZLa+yXf66+HNZtzZ5rzKu8fCmOb6T9b
         Ntzc5PecyaCK93BiZloJSwify++Js423sTf/le0ow1gxeIklCGxTOCXcTGms+lQUNg9f
         TFN5fXJ84yhgu9grSbPxRBPKf9uiZoqj/UIwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081821; x=1795686621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dZ4cmAmQesCm/MvGfei3ceTdFCLl5G2LA1H0kN3O7dY=;
        b=JKS4oyRKbsOd+g9wOEBmHs+g+4JVW144AzPLTX8jQpqne8qzEW4dIsq/AKfjTePdpG
         BJBsmjnX+8/bZmnWFOp31T3xmdaFji63mBOOOChSJ9SZEDdSB9ttqLrKMgkDdW2MfB98
         J/ayf6LwRohMJI5KEf/YQ8CxjwzXjqrifA2HwRZk5XQSyfSvdOGQS9yrpwAvBIcQ1trS
         RUmWjUpf8tQM8SihqDf/Z74Rb94IqEFOqSZ6nb04wGRJDhk7sjLd4+TgJVtMX1I4nfkr
         GWoA7vem/0EMpX1GFHnSePh3CMAwp9wxRaSvbzihI582jpAymp+ufYxqZbASwUf9rEle
         D1BA==
X-Gm-Message-State: APuU4Z8YEZgGnIYyzJxE+2aBNAjXIInsR7tdC9e9lmyYG+p6rQ/ueupt
	nQd4Geq0v5cmXrtX7d4PAlmQVgkWSZPh+z0jzu2AERVArci3sTbqOTmUHMjHW79QutOARSrsIK3
	TwpO+9J1ntly5walvurna426jfg6HkVta6t9NrN2D
X-Gm-Gg: AYBFou2HhpM7cmYTI80OrI/+7moJbzIGXZonEacia8h93VuRk4vN7ga0oCHDUy8uJXb
	RKDWoYoZ9g9gOB/Z3lu4lHQNcUjT1p/4WBI0wLcSqJ+QJwLfwr1WIDywlk+0WBIeEk7StdGOiyA
	rL2rCiSgqSGg7ldAsl3AlvEjdgR7BhRm/QnT/5gpgh5mSf9BhcmY5at4ArlayPUI46vib3WQ0s2
	iA4GHizo13jSPqtqB7WU3hP3UwLInJmtM5tvhDhpm9Qpo7G2zaumG0nOsbtNvHWw7pOT8idPSuP
	jKRPLFlviyUJSLypzyIFxkI7AGB89oz16MmB5FnJHUkKGFXofTz0ywUGvtoj8YlJrrTXIe+HiHK
	hBOB0cEq3czRw6taKjGINXbR3J8F53RzzI7c1paooeumerqInZtgICBsvjhuVJu1bGrOVxKtLMk
	DDYGdaI/Jm0T0zAMnY
X-Received: by 2002:a05:6a20:1f28:b0:400:751c:926c with SMTP id
 adf61e73a8af0-400ac3dd14cmr453399637.28.1795081821070; Thu, 19 Nov 2026
 01:50:21 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119001539.2868072-1-stephen@networkplumber.org>
 <20261119001539.2868072-4-stephen@networkplumber.org> <CAM0EoMkLUeJdzCBxsknqxSKAZ2Q7WhAB9ifV_tKXne4fPxY7YA@mail.gmail.com>
In-Reply-To: <CAM0EoMkLUeJdzCBxsknqxSKAZ2Q7WhAB9ifV_tKXne4fPxY7YA@mail.gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Thu, 19 Nov 2026 04:50:09 -0500
X-Gm-Features: AclHuK-7-Aw6Fd4APMEX2einU_KTDa_bH-I_PbIKJgYjHQmnh7aHfiO6VXC2xNc
Message-ID: <CAM0EoMnGzNOCBpkXy5A3DXeEjWJwyUbj3As=Htc5E3QWtUXrCg@mail.gmail.com>
Subject: Re: [PATCH iproute2-next 3/5] tc: remove eBPF map export and exec bpf import
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, Jiri Pirko <jiri@resnulli.us>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 4:19=E2=80=AFAM Jamal Hadi Salim <jhs@mojatatu.com>=
 wrote:
>
> On Wed, Nov 18, 2026 at 7:15=E2=80=AFPM Stephen Hemminger
> <stephen@networkplumber.org> wrote:
> >
> > The export option of tc bpf filters and actions sends the map file
> > descriptors to whatever process is bound to the given Unix socket.
> > The socket owner is not checked, so the maps can end up with an
> > unrelated process that happens to be bound to that path.
> >
> > This only works with the legacy ELF loader; with libbpf nothing is
> > sent, so the feature has been dead in default builds for a while.
> > Maps can be shared by pinning them in bpffs instead.
> >
> > Remove the export option, the exec bpf import and run commands, and
> > the TC_BPF_UDS environment variable.
> >
>
>
> I dont think this code changes in iproute2-next (didnt try iproute2
> tree) - but for tc testing i use:
> https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git
> (origin/main =3D 9eee7bb8 ("Merge remote-tracking branch 'main/main'
> into next", 2026-11-18))
> libbpf 1.3.0 default and LIBBPF_FORCE=3Doff
>
>      m_bpf.c:107:25: error: 'bpf_obj' undeclared (first use in this funct=
ion)
>      m_bpf.c:108:25: error: 'bpf_uds_name' undeclared (first use in
> this function)
>      m_bpf.c:108:43: error: 'struct bpf_cfg_in' has no member named 'uds'
>      make[1]: *** [../config.mk:47: m_bpf.o] Error 1
>      make: *** [Makefile:67: all] Error 2
>
> suspect: the patch removes this declaration?
> -  const char *bpf_obj =3D NULL, *bpf_uds_name =3D NULL;
>
> Attached fixes it.
>

I should have added that your comment that it is "Dead in default
builds" is not accurate.
You removed a working feature for LIBBPF_FORCE=3Doff builds i.e the only
in-tree way to spawn a helper that inherits the maps without pinning.

Note: I am not arguing that it shouldnt be removed (you cannot make it
safe without redesigning the trust model), but at minimal the commit
body should say "legacy-only builds lose a working import/run" and
point at bpftool + bpffs pinning for migration.

Also, reported by - does that need an email address?

cheers,
jamal


> > Also update the man page.
> >
> > Fixes: 6256f8c9e45f ("tc, bpf: finalize eBPF support for cls and act fr=
ont-end")
> > Reported-by: Anthropic OSS scanner (ANT-2026-5S9IO0L4)
> > Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
> > ---
> >  bash-completion/tc |  18 +---
> >  include/bpf_scm.h  |  77 ----------------
> >  include/bpf_util.h |  18 +---
> >  lib/bpf_legacy.c   | 217 +--------------------------------------------
> >  man/man8/tc-bpf.8  | 113 +++--------------------
> >  tc/e_bpf.c         | 157 ++++++--------------------------
> >  tc/f_bpf.c         |  15 +---
> >  tc/m_bpf.c         |  16 +---
> >  8 files changed, 50 insertions(+), 581 deletions(-)
> >  delete mode 100644 include/bpf_scm.h
> >
> > diff --git a/bash-completion/tc b/bash-completion/tc
> > index c18288a3..dfbe5624 100644
> > --- a/bash-completion/tc
> > +++ b/bash-completion/tc
> > @@ -205,7 +205,7 @@ _tc_direct_complete()
> >              ;;
> >
> >          # BPF options - used for filters, actions, and exec
> > -        export|bytecode|bytecode-file|object-file)
> > +        bytecode|bytecode-file|object-file)
> >              _filedir
> >              return 0
> >              ;;
> > @@ -230,10 +230,6 @@ _tc_direct_complete()
> >              fi
> >              return 0
> >              ;;
> > -        import|run)
> > -            _filedir
> > -            return 0
> > -            ;;
> >          type)
> >              COMPREPLY+=3D( $( compgen -W 'cls act' -- "$cur" ) )
> >              return 0
> > @@ -387,10 +383,7 @@ _tc_qdisc_options()
> >  _tc_bpf_options()
> >  {
> >      [[ ${words[${#words[@]}-3]} =3D=3D object-file ]] && \
> > -        _tc_once_attr 'section export'
> > -    [[ ${words[${#words[@]}-5]} =3D=3D object-file ]] && \
> > -        [[ ${words[${#words[@]}-3]} =3D~ (section|export) ]] && \
> > -        _tc_once_attr 'section export'
> > +        _tc_once_attr 'section'
> >      _tc_one_of_list 'bytecode bytecode-file object-file object-pinned'
> >      _tc_once_attr 'verbose index direct-action action classid'
> >      return 0
> > @@ -524,11 +517,6 @@ _tc_action_options()
> >  _tc_exec_options()
> >  {
> >      case $1 in
> > -        import)
> > -            [[ ${words[${#words[@]}-3]} =3D=3D import ]] && \
> > -                _tc_once_attr 'run'
> > -            return 0
> > -            ;;
> >          graft)
> >              COMPREPLY+=3D( $( compgen -W 'key type' -- "$cur" ) )
> >              [[ ${words[${#words[@]}-3]} =3D=3D object-file ]] && \
> > @@ -772,7 +760,7 @@ _tc()
> >          exec)
> >              case $subcmd in
> >                  bpf)
> > -                    local excmd exwd EXEC_KIND=3D' import debug graft =
'
> > +                    local excmd exwd EXEC_KIND=3D' debug graft '
> >                      for ((exwd=3D$subcword; exwd < ${#words[@]}-1; exw=
d++)); do
> >                          if [[ $EXEC_KIND =3D~ ' '${words[exwd]}' ' ]];=
 then
> >                              excmd=3D${words[exwd]}
> > diff --git a/include/bpf_scm.h b/include/bpf_scm.h
> > deleted file mode 100644
> > index 669f0538..00000000
> > --- a/include/bpf_scm.h
> > +++ /dev/null
> > @@ -1,77 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0 */
> > -#ifndef __BPF_SCM__
> > -#define __BPF_SCM__
> > -
> > -#include <sys/types.h>
> > -#include <sys/socket.h>
> > -#include <sys/un.h>
> > -
> > -#include "utils.h"
> > -#include "bpf_elf.h"
> > -
> > -#define BPF_SCM_AUX_VER                1
> > -#define BPF_SCM_MAX_FDS                ELF_MAX_MAPS
> > -#define BPF_SCM_MSG_SIZE       1024
> > -
> > -struct bpf_elf_st {
> > -       dev_t st_dev;
> > -       ino_t st_ino;
> > -};
> > -
> > -struct bpf_map_aux {
> > -       unsigned short uds_ver;
> > -       unsigned short num_ent;
> > -       char obj_name[64];
> > -       struct bpf_elf_st obj_st;
> > -       struct bpf_elf_map ent[BPF_SCM_MAX_FDS];
> > -};
> > -
> > -struct bpf_map_set_msg {
> > -       struct msghdr hdr;
> > -       struct iovec iov;
> > -       char msg_buf[BPF_SCM_MSG_SIZE];
> > -       struct bpf_map_aux aux;
> > -};
> > -
> > -static inline int *bpf_map_set_init(struct bpf_map_set_msg *msg,
> > -                                   struct sockaddr_un *addr,
> > -                                   unsigned int addr_len)
> > -{
> > -       const unsigned int cmsg_ctl_len =3D sizeof(int) * BPF_SCM_MAX_F=
DS;
> > -       struct cmsghdr *cmsg;
> > -
> > -       msg->iov.iov_base =3D &msg->aux;
> > -       msg->iov.iov_len =3D sizeof(msg->aux);
> > -
> > -       msg->hdr.msg_iov =3D &msg->iov;
> > -       msg->hdr.msg_iovlen =3D 1;
> > -
> > -       msg->hdr.msg_name =3D (struct sockaddr *)addr;
> > -       msg->hdr.msg_namelen =3D addr_len;
> > -
> > -       BUILD_BUG_ON(sizeof(msg->msg_buf) < cmsg_ctl_len);
> > -       msg->hdr.msg_control =3D &msg->msg_buf;
> > -       msg->hdr.msg_controllen =3D cmsg_ctl_len;
> > -
> > -       cmsg =3D CMSG_FIRSTHDR(&msg->hdr);
> > -       cmsg->cmsg_len =3D msg->hdr.msg_controllen;
> > -       cmsg->cmsg_level =3D SOL_SOCKET;
> > -       cmsg->cmsg_type =3D SCM_RIGHTS;
> > -
> > -       return (int *)CMSG_DATA(cmsg);
> > -}
> > -
> > -static inline void bpf_map_set_init_single(struct bpf_map_set_msg *msg=
,
> > -                                          int num)
> > -{
> > -       struct cmsghdr *cmsg;
> > -
> > -       msg->hdr.msg_controllen =3D CMSG_LEN(sizeof(int) * num);
> > -       msg->iov.iov_len =3D offsetof(struct bpf_map_aux, ent) +
> > -                          sizeof(struct bpf_elf_map) * num;
> > -
> > -       cmsg =3D CMSG_FIRSTHDR(&msg->hdr);
> > -       cmsg->cmsg_len =3D msg->hdr.msg_controllen;
> > -}
> > -
> > -#endif /* __BPF_SCM__ */
> > diff --git a/include/bpf_util.h b/include/bpf_util.h
> > index e1b8d327..78c38e80 100644
> > --- a/include/bpf_util.h
> > +++ b/include/bpf_util.h
> > @@ -16,9 +16,8 @@
> >  #include <linux/elf-em.h>
> >
> >  #include "utils.h"
> > -#include "bpf_scm.h"
> > +#include "bpf_elf.h"
> >
> > -#define BPF_ENV_UDS    "TC_BPF_UDS"
> >  #define BPF_ENV_MNT    "TC_BPF_MNT"
> >
> >  #ifndef BPF_MAX_LOG
> > @@ -60,7 +59,6 @@ struct bpf_cfg_in {
> >         const char *object;
> >         const char *section;
> >         const char *prog_name;
> > -       const char *uds;
> >         enum bpf_prog_type type;
> >         enum bpf_mode mode;
> >         __u32 ifindex;
> > @@ -282,9 +280,6 @@ int bpf_dump_prog_info(FILE *f, uint32_t id);
> >  int bpf(int cmd, union bpf_attr *attr, unsigned int size);
> >
> >  #ifdef HAVE_ELF
> > -int bpf_send_map_fds(const char *path, const char *obj);
> > -int bpf_recv_map_fds(const char *path, int *fds, struct bpf_map_aux *a=
ux,
> > -                    unsigned int entries);
> >  #ifdef HAVE_LIBBPF
> >  int iproute2_bpf_elf_ctx_init(struct bpf_cfg_in *cfg);
> >  int iproute2_bpf_fetch_ancillary(void);
> > @@ -296,17 +291,6 @@ int iproute2_find_map_name_by_id(unsigned int map_=
id, char *name);
> >  int iproute2_load_libbpf(struct bpf_cfg_in *cfg);
> >  #endif /* HAVE_LIBBPF */
> >  #else
> > -static inline int bpf_send_map_fds(const char *path, const char *obj)
> > -{
> > -       return 0;
> > -}
> > -
> > -static inline int bpf_recv_map_fds(const char *path, int *fds,
> > -                                  struct bpf_map_aux *aux,
> > -                                  unsigned int entries)
> > -{
> > -       return -1;
> > -}
> >  #ifdef HAVE_LIBBPF
> >  static inline int iproute2_load_libbpf(struct bpf_cfg_in *cfg)
> >  {
> > diff --git a/lib/bpf_legacy.c b/lib/bpf_legacy.c
> > index 5b8ac47d..f9844fd4 100644
> > --- a/lib/bpf_legacy.c
> > +++ b/lib/bpf_legacy.c
> > @@ -42,13 +42,11 @@
> >
> >  #include "bpf_util.h"
> >  #include "bpf_elf.h"
> > -#include "bpf_scm.h"
> >
> >  struct bpf_prog_meta {
> >         const char *type;
> >         const char *subdir;
> >         const char *section;
> > -       bool may_uds_export;
> >  };
> >
> >  static const enum bpf_prog_type __bpf_types[] =3D {
> > @@ -65,13 +63,11 @@ static const struct bpf_prog_meta __bpf_prog_meta[]=
 =3D {
> >                 .type           =3D "cls",
> >                 .subdir         =3D "tc",
> >                 .section        =3D ELF_SECTION_CLASSIFIER,
> > -               .may_uds_export =3D true,
> >         },
> >         [BPF_PROG_TYPE_SCHED_ACT] =3D {
> >                 .type           =3D "act",
> >                 .subdir         =3D "tc",
> >                 .section        =3D ELF_SECTION_ACTION,
> > -               .may_uds_export =3D true,
> >         },
> >         [BPF_PROG_TYPE_XDP] =3D {
> >                 .type           =3D "xdp",
> > @@ -827,7 +823,7 @@ static int bpf_obj_pinned(const char *pathname, enu=
m bpf_prog_type type)
> >
> >  static int bpf_do_parse(struct bpf_cfg_in *cfg, const bool *opt_tbl)
> >  {
> > -       const char *file, *section, *uds_name, *prog_name;
> > +       const char *file, *section, *prog_name;
> >         bool verbose =3D false;
> >         int i, ret, argc;
> >         char **argv;
> > @@ -858,7 +854,7 @@ static int bpf_do_parse(struct bpf_cfg_in *cfg, con=
st bool *opt_tbl)
> >         }
> >
> >         NEXT_ARG();
> > -       file =3D section =3D uds_name =3D prog_name =3D NULL;
> > +       file =3D section =3D prog_name =3D NULL;
> >         if (cfg->mode =3D=3D EBPF_OBJECT || cfg->mode =3D=3D EBPF_PINNE=
D) {
> >                 file =3D *argv;
> >                 NEXT_ARG_FWD();
> > @@ -901,16 +897,6 @@ static int bpf_do_parse(struct bpf_cfg_in *cfg, co=
nst bool *opt_tbl)
> >                         NEXT_ARG_FWD();
> >                 }
> >
> > -               if (__bpf_prog_meta[cfg->type].may_uds_export) {
> > -                       uds_name =3D getenv(BPF_ENV_UDS);
> > -                       if (argc > 0 && !uds_name &&
> > -                           matches(*argv, "export") =3D=3D 0) {
> > -                               NEXT_ARG();
> > -                               uds_name =3D *argv;
> > -                               NEXT_ARG_FWD();
> > -                       }
> > -               }
> > -
> >                 if (argc > 0 && matches(*argv, "verbose") =3D=3D 0) {
> >                         verbose =3D true;
> >                         NEXT_ARG_FWD();
> > @@ -934,7 +920,6 @@ static int bpf_do_parse(struct bpf_cfg_in *cfg, con=
st bool *opt_tbl)
> >
> >         cfg->object  =3D file;
> >         cfg->section =3D section;
> > -       cfg->uds     =3D uds_name;
> >         cfg->argc    =3D argc;
> >         cfg->argv    =3D argv;
> >         cfg->verbose =3D verbose;
> > @@ -1179,7 +1164,6 @@ struct bpf_elf_ctx {
> >         enum bpf_prog_type      type;
> >         __u32                   ifindex;
> >         bool                    verbose;
> > -       struct bpf_elf_st       stat;
> >         struct bpf_hash_entry   *ht[256];
> >         char                    *log;
> >         size_t                  log_size;
> > @@ -1191,13 +1175,6 @@ struct bpf_elf_sec_data {
> >         const char              *sec_name;
> >  };
> >
> > -struct bpf_map_data {
> > -       int                     *fds;
> > -       const char              *obj;
> > -       struct bpf_elf_st       *st;
> > -       struct bpf_elf_map      *ent;
> > -};
> > -
> >  static bool bpf_log_has_data(struct bpf_elf_ctx *ctx)
> >  {
> >         return ctx->log && ctx->log[0];
> > @@ -2647,24 +2624,6 @@ static int bpf_fill_prog_arrays(struct bpf_elf_c=
tx *ctx)
> >         return 0;
> >  }
> >
> > -static void bpf_save_finfo(struct bpf_elf_ctx *ctx)
> > -{
> > -       struct stat st;
> > -       int ret;
> > -
> > -       memset(&ctx->stat, 0, sizeof(ctx->stat));
> > -
> > -       ret =3D fstat(ctx->obj_fd, &st);
> > -       if (ret < 0) {
> > -               fprintf(stderr, "Stat of elf file failed: %s\n",
> > -                       strerror(errno));
> > -               return;
> > -       }
> > -
> > -       ctx->stat.st_dev =3D st.st_dev;
> > -       ctx->stat.st_ino =3D st.st_ino;
> > -}
> > -
> >  static int bpf_read_pin_mapping(FILE *fp, uint32_t *id, char *path)
> >  {
> >         char buff[PATH_MAX];
> > @@ -2877,7 +2836,6 @@ static int bpf_elf_ctx_init(struct bpf_elf_ctx *c=
tx, const char *pathname,
> >                 goto out_free;
> >         }
> >
> > -       bpf_save_finfo(ctx);
> >         bpf_hash_init(ctx, CONF_ETC_DIR "/bpf_pinning");
> >         if (ret =3D=3D -ENOENT)
> >                 ret =3D bpf_hash_init(ctx, CONF_USR_DIR "/bpf_pinning")=
;
> > @@ -2892,19 +2850,6 @@ out_fd:
> >         return ret;
> >  }
> >
> > -static int bpf_maps_count(struct bpf_elf_ctx *ctx)
> > -{
> > -       int i, count =3D 0;
> > -
> > -       for (i =3D 0; i < ARRAY_SIZE(ctx->map_fds); i++) {
> > -               if (!ctx->map_fds[i])
> > -                       break;
> > -               count++;
> > -       }
> > -
> > -       return count;
> > -}
> > -
> >  static void bpf_maps_teardown(struct bpf_elf_ctx *ctx)
> >  {
> >         int i;
> > @@ -2975,164 +2920,6 @@ out:
> >         return fd;
> >  }
> >
> > -static int
> > -bpf_map_set_send(int fd, struct sockaddr_un *addr, unsigned int addr_l=
en,
> > -                const struct bpf_map_data *aux, unsigned int entries)
> > -{
> > -       struct bpf_map_set_msg msg =3D {
> > -               .aux.uds_ver =3D BPF_SCM_AUX_VER,
> > -               .aux.num_ent =3D entries,
> > -       };
> > -       int *cmsg_buf, min_fd;
> > -       char *amsg_buf;
> > -       int i;
> > -
> > -       strlcpy(msg.aux.obj_name, aux->obj, sizeof(msg.aux.obj_name));
> > -       memcpy(&msg.aux.obj_st, aux->st, sizeof(msg.aux.obj_st));
> > -
> > -       cmsg_buf =3D bpf_map_set_init(&msg, addr, addr_len);
> > -       amsg_buf =3D (char *)msg.aux.ent;
> > -
> > -       for (i =3D 0; i < entries; i +=3D min_fd) {
> > -               int ret;
> > -
> > -               min_fd =3D min(BPF_SCM_MAX_FDS * 1U, entries - i);
> > -               bpf_map_set_init_single(&msg, min_fd);
> > -
> > -               memcpy(cmsg_buf, &aux->fds[i], sizeof(aux->fds[0]) * mi=
n_fd);
> > -               memcpy(amsg_buf, &aux->ent[i], sizeof(aux->ent[0]) * mi=
n_fd);
> > -
> > -               ret =3D sendmsg(fd, &msg.hdr, 0);
> > -               if (ret <=3D 0)
> > -                       return ret ? : -1;
> > -       }
> > -
> > -       return 0;
> > -}
> > -
> > -static int
> > -bpf_map_set_recv(int fd, int *fds,  struct bpf_map_aux *aux,
> > -                unsigned int entries)
> > -{
> > -       struct bpf_map_set_msg msg;
> > -       int *cmsg_buf, min_fd;
> > -       char *amsg_buf, *mmsg_buf;
> > -       unsigned int needed =3D 1;
> > -       int i;
> > -
> > -       cmsg_buf =3D bpf_map_set_init(&msg, NULL, 0);
> > -       amsg_buf =3D (char *)msg.aux.ent;
> > -       mmsg_buf =3D (char *)&msg.aux;
> > -
> > -       for (i =3D 0; i < min(entries, needed); i +=3D min_fd) {
> > -               struct cmsghdr *cmsg;
> > -               int ret;
> > -
> > -               min_fd =3D min(entries, entries - i);
> > -               bpf_map_set_init_single(&msg, min_fd);
> > -
> > -               ret =3D recvmsg(fd, &msg.hdr, 0);
> > -               if (ret <=3D 0)
> > -                       return ret ? : -1;
> > -
> > -               cmsg =3D CMSG_FIRSTHDR(&msg.hdr);
> > -               if (!cmsg || cmsg->cmsg_type !=3D SCM_RIGHTS)
> > -                       return -EINVAL;
> > -               if (msg.hdr.msg_flags & MSG_CTRUNC)
> > -                       return -EIO;
> > -               if (msg.aux.uds_ver !=3D BPF_SCM_AUX_VER)
> > -                       return -ENOSYS;
> > -
> > -               min_fd =3D (cmsg->cmsg_len - sizeof(*cmsg)) / sizeof(fd=
);
> > -               if (min_fd > entries || min_fd <=3D 0)
> > -                       return -EINVAL;
> > -
> > -               memcpy(&fds[i], cmsg_buf, sizeof(fds[0]) * min_fd);
> > -               memcpy(&aux->ent[i], amsg_buf, sizeof(aux->ent[0]) * mi=
n_fd);
> > -               memcpy(aux, mmsg_buf, offsetof(struct bpf_map_aux, ent)=
);
> > -
> > -               needed =3D aux->num_ent;
> > -       }
> > -
> > -       return 0;
> > -}
> > -
> > -int bpf_send_map_fds(const char *path, const char *obj)
> > -{
> > -       struct bpf_elf_ctx *ctx =3D &__ctx;
> > -       struct sockaddr_un addr =3D { .sun_family =3D AF_UNIX };
> > -       struct bpf_map_data bpf_aux =3D {
> > -               .fds =3D ctx->map_fds,
> > -               .ent =3D ctx->maps,
> > -               .st  =3D &ctx->stat,
> > -               .obj =3D obj,
> > -       };
> > -       int fd, ret =3D -1;
> > -
> > -       fd =3D socket(AF_UNIX, SOCK_DGRAM, 0);
> > -       if (fd < 0) {
> > -               fprintf(stderr, "Cannot open socket: %s\n",
> > -                       strerror(errno));
> > -               goto out;
> > -       }
> > -
> > -       strlcpy(addr.sun_path, path, sizeof(addr.sun_path));
> > -
> > -       ret =3D connect(fd, (struct sockaddr *)&addr, sizeof(addr));
> > -       if (ret < 0) {
> > -               fprintf(stderr, "Cannot connect to %s: %s\n",
> > -                       path, strerror(errno));
> > -               goto out;
> > -       }
> > -
> > -       ret =3D bpf_map_set_send(fd, &addr, sizeof(addr), &bpf_aux,
> > -                              bpf_maps_count(ctx));
> > -       if (ret < 0)
> > -               fprintf(stderr, "Cannot send fds to %s: %s\n",
> > -                       path, strerror(errno));
> > -
> > -       bpf_maps_teardown(ctx);
> > -out:
> > -       if (fd >=3D 0)
> > -               close(fd);
> > -       return ret;
> > -}
> > -
> > -int bpf_recv_map_fds(const char *path, int *fds, struct bpf_map_aux *a=
ux,
> > -                    unsigned int entries)
> > -{
> > -       struct sockaddr_un addr =3D { .sun_family =3D AF_UNIX };
> > -       int fd, ret =3D -1;
> > -
> > -       fd =3D socket(AF_UNIX, SOCK_DGRAM, 0);
> > -       if (fd < 0) {
> > -               fprintf(stderr, "Cannot open socket: %s\n",
> > -                       strerror(errno));
> > -               goto out;
> > -       }
> > -
> > -       strlcpy(addr.sun_path, path, sizeof(addr.sun_path));
> > -
> > -       ret =3D bind(fd, (struct sockaddr *)&addr, sizeof(addr));
> > -       if (ret < 0) {
> > -               fprintf(stderr, "Cannot bind to socket: %s\n",
> > -                       strerror(errno));
> > -               goto out;
> > -       }
> > -
> > -       ret =3D bpf_map_set_recv(fd, fds, aux, entries);
> > -       if (ret < 0)
> > -               fprintf(stderr, "Cannot recv fds from %s: %s\n",
> > -                       path, strerror(errno));
> > -
> > -       unlink(addr.sun_path);
> > -
> > -out:
> > -       if (fd >=3D 0)
> > -               close(fd);
> > -       return ret;
> > -}
> > -
> >  #ifdef HAVE_LIBBPF
> >  /* The following functions are wrapper functions for libbpf code to be
> >   * compatible with the legacy format. So all the functions have prefix
> > diff --git a/man/man8/tc-bpf.8 b/man/man8/tc-bpf.8
> > index 01230ce6..cd781eea 100644
> > --- a/man/man8/tc-bpf.8
> > +++ b/man/man8/tc-bpf.8
> > @@ -10,8 +10,6 @@ queueing disciplines
> >  OBJ_FILE ] [
> >  .B section
> >  CLS_NAME ] [
> > -.B export
> > -UDS_FILE ] [
> >  .B verbose
> >  ] [
> >  .B direct-action
> > @@ -35,8 +33,6 @@ CLASSID ]
> >  OBJ_FILE ] [
> >  .B section
> >  CLS_NAME ] [
> > -.B export
> > -UDS_FILE ] [
> >  .B verbose
> >  ]
> >
> > @@ -158,17 +154,6 @@ that a single object file can contain multiple cla=
ssifier and actions,
> >  the corresponding section name needs to be specified, if it differs
> >  from the defaults.
> >
> > -.SS export
> > -points to a Unix domain socket file. In case the eBPF object file also
> > -contains a section named "maps" with eBPF map specifications, then the
> > -map file descriptors can be handed off via the Unix domain socket to
> > -an eBPF "agent" herding all descriptors after tc lifetime. This can be
> > -some third party application implementing the IPC counterpart for the
> > -import, that uses them for calling into
> > -.B bpf(2)
> > -system call to read out or update eBPF map data from user space, for
> > -example, for monitoring purposes or to push down new policies.
> > -
> >  .SS verbose
> >  if set, it will dump the eBPF verifier output, even if loading the eBP=
F
> >  program was successful. By default, only on error, the verifier log is
> > @@ -250,8 +235,8 @@ rather resides in a text file.
> >
> >  .SH EXAMPLES
> >  .SS eBPF TOOLING
> > -A full blown example including eBPF agent code can be found inside the
> > -iproute2 source package under:
> > +Example eBPF programs can be found inside the iproute2 source package
> > +under:
> >  .B examples/bpf/
> >
> >  As prerequisites, the kernel needs to have the eBPF system call namely
> > @@ -424,90 +409,20 @@ example:
> >  The advantage of this is that the classifier and the two actions can
> >  then share eBPF maps with each other, if implemented in the programs.
> >
> > -In order to access eBPF maps from user space beyond
> > -.B tc(8)
> > -setup lifetime, the ownership can be transferred to an eBPF agent via
> > -Unix domain sockets. There are two possibilities for implementing this=
:
> > -
> > -.B 1)
> > -implementation of an own eBPF agent that takes care of setting up
> > -the Unix domain socket and implementing the protocol that
> > +eBPF maps can be accessed from user space beyond
> >  .B tc(8)
> > -dictates. A code example of this can be found inside the iproute2
> > -source package under:
> > -.B examples/bpf/
> > -
> > -.B 2)
> > -use
> > -.B tc exec
> > -for transferring the eBPF map file descriptors through a Unix domain
> > -socket, and spawning an application such as
> > -.B sh(1)
> > -\&. This approach's advantage is that tc will place the file descripto=
rs
> > -into the environment and thus make them available just like stdin, std=
out,
> > -stderr file descriptors, meaning, in case user applications run from w=
ithin
> > -this fd-owner shell, they can terminate and restart without losing eBP=
F
> > -maps file descriptors. Example invocation with the previous classifier=
 and
> > -action mixture:
> > -
> > -.in +4n
> > -.B tc exec bpf imp /tmp/bpf
> > -.br
> > -.B tc filter add dev em1 parent 1: bpf obj bpf.o exp /tmp/bpf flowid 1=
:1 \e
> > -.br
> > -.in +25n
> > -.B                          action bpf obj bpf.o sec action-mark \e
> > -.br
> > -.B                          action bpf obj bpf.o sec action-rand ok
> > -.in -25n
> > -.in -4n
> > -
> > -Assuming that eBPF maps are shared with classifier and actions, it's
> > -enough to export them once, for example, from within the classifier
> > -or action command. tc will setup all eBPF map file descriptors at the
> > -time when the object file is first parsed.
> > -
> > -When a shell has been spawned, the environment will have a couple of
> > -eBPF related variables. BPF_NUM_MAPS provides the total number of maps
> > -that have been transferred over the Unix domain socket. BPF_MAP<X>'s
> > -value is the file descriptor number that can be accessed in eBPF agent
> > -applications, in other words, it can directly be used as the file
> > -descriptor value for the
> > +setup lifetime by pinning them in the BPF file system. Maps declared
> > +with the
> > +.B pinning
> > +attribute set to
> > +.B LIBBPF_PIN_BY_NAME
> > +are pinned under
> > +.B /sys/fs/bpf/tc/globals/
> > +and can be inspected or updated with
> > +.B bpftool(8)
> > +or any program using the
> >  .B bpf(2)
> > -system call to retrieve or alter eBPF map values. <X> denotes the
> > -identifier of the eBPF map. It corresponds to the
> > -.B id
> > -member of
> > -.B struct bpf_elf_map
> > -\& from the tc eBPF map specification.
> > -
> > -The environment in this example looks as follows:
> > -
> > -.in +4n
> > -.nf
> > -.sp
> > -sh# env | grep BPF
> > -    BPF_NUM_MAPS=3D3
> > -    BPF_MAP1=3D6
> > -    BPF_MAP0=3D5
> > -    BPF_MAP2=3D7
> > -sh# ls -la /proc/self/fd
> > -    [...]
> > -    lrwx------. 1 root root 64 Apr 14 16:46 5 -> anon_inode:bpf-map
> > -    lrwx------. 1 root root 64 Apr 14 16:46 6 -> anon_inode:bpf-map
> > -    lrwx------. 1 root root 64 Apr 14 16:46 7 -> anon_inode:bpf-map
> > -sh# my_bpf_agent
> > -.fi
> > -.in
> > -
> > -eBPF agents are very useful in that they can prepopulate eBPF maps fro=
m
> > -user space, monitor statistics via maps and based on that feedback, fo=
r
> > -example, rewrite classids in eBPF map values during runtime. Given tha=
t eBPF
> > -agents are implemented as normal applications, they can also dynamical=
ly
> > -receive traffic control policies from external controllers and thus pu=
sh
> > -them down into eBPF maps to dynamically adapt to network conditions. M=
oreover,
> > -eBPF maps can also be shared with other eBPF program types (e.g. traci=
ng),
> > -thus very powerful combination can therefore be implemented.
> > +system call.
> >
> >  .SS eBPF PROGRAMMING
> >
> > diff --git a/tc/e_bpf.c b/tc/e_bpf.c
> > index cca853f9..391a3554 100644
> > --- a/tc/e_bpf.c
> > +++ b/tc/e_bpf.c
> > @@ -6,167 +6,60 @@
> >   */
> >
> >  #include <stdio.h>
> > -#include <unistd.h>
> >
> >  #include "utils.h"
> >
> >  #include "tc_util.h"
> >
> >  #include "bpf_util.h"
> > -#include "bpf_elf.h"
> > -#include "bpf_scm.h"
> > -
> > -#define BPF_DEFAULT_CMD        "/bin/sh"
> > -
> > -static char *argv_default[] =3D { BPF_DEFAULT_CMD, NULL };
> >
> >  static void explain(void)
> >  {
> >         fprintf(stderr,
> > -               "Usage: ... bpf [ import UDS_FILE ] [ run CMD ]\n"
> > -               "       ... bpf [ debug ]\n"
> > +               "Usage: ... bpf [ debug ]\n"
> >                 "       ... bpf [ graft MAP_FILE ] [ key KEY ]\n"
> >                 "          `... [ object-file OBJ_FILE ] [ type TYPE ] =
[ section NAME ] [ verbose ]\n"
> >                 "          `... [ object-pinned PROG_FILE ]\n"
> >                 "\n"
> > -               "Where UDS_FILE provides the name of a unix domain sock=
et file\n"
> > -               "to import eBPF maps and the optional CMD denotes the c=
ommand\n"
> > -               "to be executed (default: \'%s\').\n"
> >                 "Where MAP_FILE points to a pinned map, OBJ_FILE to an =
object file\n"
> >                 "and PROG_FILE to a pinned program. TYPE can be {cls, a=
ct}, where\n"
> >                 "\'cls\' is default. KEY is optional and can be inferre=
d from the\n"
> > -               "section name, otherwise it needs to be provided.\n",
> > -               BPF_DEFAULT_CMD);
> > -}
> > -
> > -static int bpf_num_env_entries(void)
> > -{
> > -       char **envp;
> > -       int num;
> > -
> > -       for (num =3D 0, envp =3D environ; *envp !=3D NULL; envp++)
> > -               num++;
> > -       return num;
> > +               "section name, otherwise it needs to be provided.\n");
> >  }
> >
> >  static int parse_bpf(const struct exec_util *eu, int argc, char **argv=
)
> >  {
> > -       char **argv_run =3D argv_default, **envp_run, *tmp;
> > -       int ret, i, env_old, env_num, env_map;
> > -       const char *bpf_uds_name =3D NULL;
> > -       int fds[BPF_SCM_MAX_FDS] =3D {};
> > -       struct bpf_map_aux aux =3D {};
> > -
> >         if (argc =3D=3D 0)
> >                 return 0;
> >
> > -       while (argc > 0) {
> > -               if (matches(*argv, "run") =3D=3D 0) {
> > -                       NEXT_ARG();
> > -                       argv_run =3D argv;
> > -                       break;
> > -               } else if (matches(*argv, "import") =3D=3D 0) {
> > -                       NEXT_ARG();
> > -                       bpf_uds_name =3D *argv;
> > -               } else if (matches(*argv, "debug") =3D=3D 0 ||
> > -                          matches(*argv, "dbg") =3D=3D 0) {
> > -                       if (bpf_trace_pipe())
> > -                               fprintf(stderr,
> > -                                       "No trace pipe, tracefs not mou=
nted?\n");
> > -                       return -1;
> > -               } else if (matches(*argv, "graft") =3D=3D 0) {
> > -                       const char *bpf_map_path;
> > -                       bool has_key =3D false;
> > -                       uint32_t key;
> > -
> > -                       NEXT_ARG();
> > -                       bpf_map_path =3D *argv;
> > +       if (matches(*argv, "debug") =3D=3D 0 ||
> > +           matches(*argv, "dbg") =3D=3D 0) {
> > +               if (bpf_trace_pipe())
> > +                       fprintf(stderr,
> > +                               "No trace pipe, tracefs not mounted?\n"=
);
> > +               return -1;
> > +       } else if (matches(*argv, "graft") =3D=3D 0) {
> > +               const char *bpf_map_path;
> > +               bool has_key =3D false;
> > +               uint32_t key;
> > +
> > +               NEXT_ARG();
> > +               bpf_map_path =3D *argv;
> > +               NEXT_ARG();
> > +               if (matches(*argv, "key") =3D=3D 0) {
> >                         NEXT_ARG();
> > -                       if (matches(*argv, "key") =3D=3D 0) {
> > -                               NEXT_ARG();
> > -                               if (get_unsigned(&key, *argv, 0)) {
> > -                                       fprintf(stderr, "Illegal \"key\=
"\n");
> > -                                       return -1;
> > -                               }
> > -                               has_key =3D true;
> > -                               NEXT_ARG();
> > +                       if (get_unsigned(&key, *argv, 0)) {
> > +                               fprintf(stderr, "Illegal \"key\"\n");
> > +                               return -1;
> >                         }
> > -                       return bpf_graft_map(bpf_map_path, has_key ?
> > -                                            &key : NULL, argc, argv);
> > -               } else {
> > -                       explain();
> > -                       return -1;
> > +                       has_key =3D true;
> > +                       NEXT_ARG();
> >                 }
> > -
> > -               NEXT_ARG_FWD();
> > +               return bpf_graft_map(bpf_map_path, has_key ?
> > +                                    &key : NULL, argc, argv);
> >         }
> >
> > -       if (!bpf_uds_name) {
> > -               fprintf(stderr, "bpf: No import parameter provided!\n")=
;
> > -               explain();
> > -               return -1;
> > -       }
> > -
> > -       if (argv_run !=3D argv_default && argc =3D=3D 0) {
> > -               fprintf(stderr, "bpf: No run command provided!\n");
> > -               explain();
> > -               return -1;
> > -       }
> > -
> > -       ret =3D bpf_recv_map_fds(bpf_uds_name, fds, &aux, ARRAY_SIZE(fd=
s));
> > -       if (ret < 0) {
> > -               fprintf(stderr, "bpf: Could not receive fds!\n");
> > -               return -1;
> > -       }
> > -
> > -       if (aux.num_ent =3D=3D 0) {
> > -               envp_run =3D environ;
> > -               goto out;
> > -       }
> > -
> > -       env_old =3D bpf_num_env_entries();
> > -       env_num =3D env_old + aux.num_ent + 2;
> > -       env_map =3D env_old + 1;
> > -
> > -       envp_run =3D malloc(sizeof(*envp_run) * env_num);
> > -       if (!envp_run) {
> > -               fprintf(stderr, "bpf: No memory left to allocate env!\n=
");
> > -               goto err;
> > -       }
> > -
> > -       for (i =3D 0; i < env_old; i++)
> > -               envp_run[i] =3D environ[i];
> > -
> > -       ret =3D asprintf(&tmp, "BPF_NUM_MAPS=3D%u", aux.num_ent);
> > -       if (ret < 0)
> > -               goto err_free;
> > -
> > -       envp_run[env_old] =3D tmp;
> > -
> > -       for (i =3D env_map; i < env_num - 1; i++) {
> > -               ret =3D asprintf(&tmp, "BPF_MAP%u=3D%u",
> > -                              aux.ent[i - env_map].id,
> > -                              fds[i - env_map]);
> > -               if (ret < 0)
> > -                       goto err_free_env;
> > -
> > -               envp_run[i] =3D tmp;
> > -       }
> > -
> > -       envp_run[env_num - 1] =3D NULL;
> > -out:
> > -       ret =3D execvpe(argv_run[0], argv_run, envp_run);
> > -       free(envp_run);
> > -       return ret;
> > -
> > -err_free_env:
> > -       for (--i; i >=3D env_old; i--)
> > -               free(envp_run[i]);
> > -err_free:
> > -       free(envp_run);
> > -err:
> > -       for (i =3D 0; i < aux.num_ent; i++)
> > -               close(fds[i]);
> > +       explain();
> >         return -1;
> >  }
> >
> > diff --git a/tc/f_bpf.c b/tc/f_bpf.c
> > index 50fe01ca..7bf9c463 100644
> > --- a/tc/f_bpf.c
> > +++ b/tc/f_bpf.c
> > @@ -27,7 +27,7 @@ static void explain(void)
> >                 " bytecode-file FILE\n"
> >                 "\n"
> >                 "eBPF use case:\n"
> > -               " object-file FILE [ section CLS_NAME ] [ export UDS_FI=
LE ]"
> > +               " object-file FILE [ section CLS_NAME ]"
> >                 " [ verbose ] [ direct-action ] [ skip_hw | skip_sw ]\n=
"
> >                 " object-pinned FILE [ direct-action ] [ skip_hw | skip=
_sw ]\n"
> >                 "\n"
> > @@ -45,9 +45,6 @@ static void explain(void)
> >                 "Where CLS_NAME refers to the section name containing t=
he\n"
> >                 "classifier (default \'%s\').\n"
> >                 "\n"
> > -               "Where UDS_FILE points to a unix domain socket file in =
order\n"
> > -               "to hand off control of all created eBPF maps to an age=
nt.\n"
> > -               "\n"
> >                 "ACTION_SPEC :=3D ... look at individual actions\n"
> >                 "NOTE: CLASSID is parsed as hexadecimal input.\n",
> >                 bpf_prog_to_default_section(bpf_type));
> > @@ -74,7 +71,6 @@ static const struct bpf_cfg_ops bpf_cb_ops =3D {
> >  static int bpf_parse_opt(const struct filter_util *qu, char *handle,
> >                          int argc, char **argv, struct nlmsghdr *n)
> >  {
> > -       const char *bpf_obj =3D NULL, *bpf_uds_name =3D NULL;
> >         struct tcmsg *t =3D NLMSG_DATA(n);
> >         unsigned int bpf_gen_flags =3D 0;
> >         unsigned int bpf_flags =3D 0;
> > @@ -82,7 +78,6 @@ static int bpf_parse_opt(const struct filter_util *qu=
, char *handle,
> >         bool seen_run =3D false;
> >         bool skip_sw =3D false;
> >         struct rtattr *tail;
> > -       int ret =3D 0;
> >
> >         if (handle) {
> >                 if (get_u32(&t->tcm_handle, handle, 0)) {
> > @@ -117,9 +112,6 @@ opt_bpf:
> >
> >                         argc =3D cfg.argc;
> >                         argv =3D cfg.argv;
> > -
> > -                       bpf_obj =3D cfg.object;
> > -                       bpf_uds_name =3D cfg.uds;
> >                 } else if (matches(*argv, "classid") =3D=3D 0 ||
> >                            matches(*argv, "flowid") =3D=3D 0) {
> >                         unsigned int classid;
> > @@ -181,10 +173,7 @@ opt_bpf:
> >
> >         tail->rta_len =3D (((void *)n) + n->nlmsg_len) - (void *)tail;
> >
> > -       if (bpf_uds_name)
> > -               ret =3D bpf_send_map_fds(bpf_uds_name, bpf_obj);
> > -
> > -       return ret;
> > +       return 0;
> >  }
> >
> >  static int bpf_print_opt(const struct filter_util *qu, FILE *f,
> > diff --git a/tc/m_bpf.c b/tc/m_bpf.c
> > index 83b21b57..c848a9d3 100644
> > --- a/tc/m_bpf.c
> > +++ b/tc/m_bpf.c
> > @@ -29,7 +29,7 @@ static void explain(void)
> >                 " bytecode-file FILE\n"
> >                 "\n"
> >                 "eBPF use case:\n"
> > -               " object-file FILE [ section ACT_NAME ] [ export UDS_FI=
LE ]"
> > +               " object-file FILE [ section ACT_NAME ]"
> >                 " [ verbose ]\n"
> >                 " object-pinned FILE\n"
> >                 "\n"
> > @@ -43,9 +43,6 @@ static void explain(void)
> >                 "Where ACT_NAME refers to the section name containing t=
he\n"
> >                 "action (default \'%s\').\n"
> >                 "\n"
> > -               "Where UDS_FILE points to a unix domain socket file in =
order\n"
> > -               "to hand off control of all created eBPF maps to an age=
nt.\n"
> > -               "\n"
> >                 "Where optionally INDEX points to an existing action, o=
r\n"
> >                 "explicitly specifies an action index upon creation.\n"=
,
> >                 bpf_prog_to_default_section(bpf_type));
> > @@ -72,12 +69,11 @@ static const struct bpf_cfg_ops bpf_cb_ops =3D {
> >  static int bpf_parse_opt(const struct action_util *a, int *ptr_argc, c=
har ***ptr_argv,
> >                          int tca_id, struct nlmsghdr *n)
> >  {
> > -       const char *bpf_obj =3D NULL, *bpf_uds_name =3D NULL;
> >         struct tc_act_bpf parm =3D {};
> >         struct bpf_cfg_in cfg =3D {};
> >         bool seen_run =3D false;
> >         struct rtattr *tail;
> > -       int argc, ret =3D 0;
> > +       int argc;
> >         char **argv;
> >
> >         argv =3D *ptr_argv;
> > @@ -107,9 +103,6 @@ opt_bpf:
> >
> >                         argc =3D cfg.argc;
> >                         argv =3D cfg.argv;
> > -
> > -                       bpf_obj =3D cfg.object;
> > -                       bpf_uds_name =3D cfg.uds;
> >                 } else if (matches(*argv, "help") =3D=3D 0) {
> >                         explain();
> >                         return -1;
> > @@ -142,13 +135,10 @@ opt_bpf:
> >         addattr_l(n, MAX_MSG, TCA_ACT_BPF_PARMS, &parm, sizeof(parm));
> >         addattr_nest_end(n, tail);
> >
> > -       if (bpf_uds_name)
> > -               ret =3D bpf_send_map_fds(bpf_uds_name, bpf_obj);
> > -
> >         *ptr_argc =3D argc;
> >         *ptr_argv =3D argv;
> >
> > -       return ret;
> > +       return 0;
> >  }
> >
> >  static int bpf_print_opt(const struct action_util *au, FILE *f, struct=
 rtattr *arg)
> > --
> > 2.53.0
> >
